import '../entities/habit.dart';

abstract class HabitsRepository {
  Stream<List<Habit>> watchHabits();

  Future<void> addHabit(Habit habit);

  Future<void> deleteHabit(String id);

  // returns date-only DateTimes
  Stream<Set<DateTime>> watchCompletions(String habitId);

  // marks or un-marks a habit as done on date
  Future<void> setCompletion(String habitId, DateTime date, bool done);

  // returns the set of habitIds that have been completed today
  Stream<Set<String>> watchTodayCompletedIds();
}
