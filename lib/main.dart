import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:habit_tracker/core/constants/hive_box_names.dart';
import 'package:habit_tracker/core/router/app_router.dart';
import 'package:habit_tracker/core/theme/app_theme.dart';
import 'package:habit_tracker/feature/habits/data/models/habit_completion_hive_model.dart';
import 'package:habit_tracker/feature/habits/data/models/habit_hive_model.dart';
import 'package:habit_tracker/feature/habits/presentation/providers/habits_providers.dart';
import 'package:habit_tracker/feature/settings/presentation/providers/theme_mode_provider.dart';
import 'package:habit_tracker/hive_registrar.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapters();

  final habitsBox = await Hive.openBox<HabitHiveModel>(HiveBoxNames.habits);
  final completionsBox =
      await Hive.openBox<HabitCompletionHiveModel>(HiveBoxNames.completions);
  final settingsBox = await Hive.openBox(HiveBoxNames.settings);

  runApp(
    ProviderScope(
      overrides: [
        habitsBoxProvider.overrideWithValue(habitsBox),
        completionsBoxProvider.overrideWithValue(completionsBox),
        settingsBoxProvider.overrideWithValue(settingsBox),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
    );
  }
}
