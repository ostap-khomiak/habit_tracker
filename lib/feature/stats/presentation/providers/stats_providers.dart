import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:habit_tracker/feature/habits/presentation/providers/habits_providers.dart';

part 'stats_providers.g.dart';

@riverpod
Stream<Set<DateTime>> completionsForHabit(Ref ref, String habitId) =>
    ref.watch(habitsRepositoryProvider).watchCompletions(habitId);
