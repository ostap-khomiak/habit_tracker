import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/feature/auth/data/migration/hive_to_firestore_migration.dart';
import 'package:habit_tracker/feature/auth/data/repositories/firebase_auth_repository.dart';
import 'package:habit_tracker/feature/auth/data/sync/firestore_to_hive_sync.dart';
import 'package:habit_tracker/feature/auth/presentation/providers/auth_providers.dart';
import 'package:habit_tracker/feature/habits/presentation/providers/habits_providers.dart';
import 'package:habit_tracker/feature/settings/presentation/providers/theme_mode_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  Future<void> _signIn(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(authRepositoryProvider).signInWithGoogle();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Sign-in failed: $e')));
      }
      return;
    }

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await migrateIfNeeded(
          uid: user.uid,
          habitsBox: ref.read(habitsBoxProvider),
          completionsBox: ref.read(completionsBoxProvider),
        );
      } catch (_) {}
    }
  }

  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    try {
      // mirror firestore state into Hive
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await syncFirestoreToHive(
          uid: user.uid,
          habitsBox: ref.read(habitsBoxProvider),
          completionsBox: ref.read(completionsBoxProvider),
        );
      }
      await ref.read(authRepositoryProvider).signOut();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Sign-out failed: $e')));
      }
    }
  }

  Widget _buildAccountTile(BuildContext context, WidgetRef ref) {
    if (!FirebaseAuthRepository.isSignInSupported) {
      return const ListTile(
        enabled: false,
        leading: Icon(Icons.account_circle_outlined),
        title: Text('Google Account'),
        subtitle: Text('Sign-in not available on this platform'),
      );
    }

    final authState = ref.watch(authStateProvider);
    return authState.when(
      loading: () => const ListTile(
        leading: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        title: Text('Checking account…'),
      ),
      error: (e, _) => ListTile(
        leading: const Icon(Icons.error_outline),
        title: const Text('Account error'),
        subtitle: Text(e.toString()),
      ),
      data: (user) {
        if (user == null) {
          return ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('Sign in with Google'),
            subtitle: const Text('Sync habits across devices'),
            onTap: () => _signIn(context, ref),
          );
        }
        return ListTile(
          leading: user.photoURL != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(user.photoURL!),
                  radius: 16,
                )
              : const Icon(Icons.account_circle),
          title: Text(user.displayName ?? 'Google Account'),
          subtitle: Text(user.email ?? ''),
          trailing: TextButton(
            onPressed: () => _signOut(context, ref),
            child: const Text('Sign out'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Appearance',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SegmentedButton<ThemeMode>(
              segments: const [
                ButtonSegment(
                  value: ThemeMode.system,
                  label: Text('System'),
                  icon: Icon(Icons.brightness_auto),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  label: Text('Light'),
                  icon: Icon(Icons.light_mode),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  label: Text('Dark'),
                  icon: Icon(Icons.dark_mode),
                ),
              ],
              selected: {themeMode},
              onSelectionChanged: (modes) =>
                  ref.read(themeModeProvider.notifier).setMode(modes.first),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              'Account',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          _buildAccountTile(context, ref),
        ],
      ),
    );
  }
}
