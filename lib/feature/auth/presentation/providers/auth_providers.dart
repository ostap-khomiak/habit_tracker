import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:habit_tracker/feature/auth/data/repositories/firebase_auth_repository.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
FirebaseAuthRepository authRepository(Ref ref) => FirebaseAuthRepository();

@Riverpod(keepAlive: true)
Stream<User?> authState(Ref ref) =>
    ref.watch(authRepositoryProvider).authStateChanges();
