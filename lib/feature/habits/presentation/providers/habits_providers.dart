import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:habit_tracker/feature/auth/presentation/providers/auth_providers.dart';
import 'package:habit_tracker/feature/habits/data/models/habit_completion_hive_model.dart';
import 'package:habit_tracker/feature/habits/data/models/habit_hive_model.dart';
import 'package:habit_tracker/feature/habits/data/repositories/firestore_habits_repository.dart';
import 'package:habit_tracker/feature/habits/data/repositories/hive_habits_repository.dart';
import 'package:habit_tracker/feature/habits/domain/entities/habit.dart';
import 'package:habit_tracker/feature/habits/domain/repositories/habits_repository.dart';

part 'habits_providers.g.dart';

final habitsBoxProvider = Provider<Box<HabitHiveModel>>(
  (ref) => throw UnimplementedError('habitsBoxProvider must be overridden'),
);

final completionsBoxProvider = Provider<Box<HabitCompletionHiveModel>>(
  (ref) =>
      throw UnimplementedError('completionsBoxProvider must be overridden'),
);

@riverpod
HabitsRepository habitsRepository(Ref ref) {
  final user = ref.watch(authStateProvider).maybeWhen(
    data: (u) => u,
    orElse: () => null,
  );
  if (user != null) {
    return FirestoreHabitsRepository(uid: user.uid);
  }
  return HiveHabitsRepository(
    ref.watch(habitsBoxProvider),
    ref.watch(completionsBoxProvider),
  );
}

@Riverpod(keepAlive: true)
Stream<List<Habit>> habitsList(Ref ref) =>
    ref.watch(habitsRepositoryProvider).watchHabits();

@Riverpod(keepAlive: true)
Stream<Set<String>> todayCompletions(Ref ref) =>
    ref.watch(habitsRepositoryProvider).watchTodayCompletedIds();
