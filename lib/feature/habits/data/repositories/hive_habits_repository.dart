import 'package:hive_ce/hive.dart';
import 'package:habit_tracker/core/util/date_utils.dart';
import 'package:habit_tracker/feature/habits/data/mappers/habit_mapper.dart';
import 'package:habit_tracker/feature/habits/data/models/habit_completion_hive_model.dart';
import 'package:habit_tracker/feature/habits/data/models/habit_hive_model.dart';
import 'package:habit_tracker/feature/habits/domain/entities/habit.dart';
import 'package:habit_tracker/feature/habits/domain/repositories/habits_repository.dart';

class HiveHabitsRepository implements HabitsRepository {
  final Box<HabitHiveModel> _habitsBox;
  final Box<HabitCompletionHiveModel> _completionsBox;

  HiveHabitsRepository(this._habitsBox, this._completionsBox);

  List<Habit> _sortedHabits() =>
      _habitsBox.values.map(HabitMapper.toDomain).toList()
        ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

  Set<DateTime> _completionsForHabit(String habitId) => _completionsBox.values
      .where((c) => c.habitId == habitId)
      .map((c) => c.date)
      .toSet();

  Set<String> _todayCompletedIds() {
    final todaySuffix = '|${formatDateKey(today)}';
    return _completionsBox.keys
        .whereType<String>()
        .where((k) => k.endsWith(todaySuffix))
        .map((k) => k.split('|').first)
        .toSet();
  }

  String _completionKey(String habitId, DateTime date) =>
      '$habitId|${formatDateKey(date)}';

  @override
  Stream<List<Habit>> watchHabits() async* {
    yield _sortedHabits();
    await for (final _ in _habitsBox.watch()) {
      yield _sortedHabits();
    }
  }

  @override
  Future<void> addHabit(Habit habit) =>
      _habitsBox.put(habit.id, HabitMapper.toHive(habit));

  @override
  Future<void> deleteHabit(String id) async {
    await _habitsBox.delete(id);
    final keysToDelete = _completionsBox.keys
        .whereType<String>()
        .where((k) => k.startsWith('$id|'))
        .toList();
    await _completionsBox.deleteAll(keysToDelete);
  }

  @override
  Stream<Set<DateTime>> watchCompletions(String habitId) async* {
    yield _completionsForHabit(habitId);
    await for (final event in _completionsBox.watch()) {
      if (event.key is String &&
          (event.key as String).startsWith('$habitId|')) {
        yield _completionsForHabit(habitId);
      }
    }
  }

  @override
  Future<void> setCompletion(String habitId, DateTime date, bool done) async {
    final key = _completionKey(habitId, date.dateOnly);
    if (done) {
      await _completionsBox.put(
        key,
        HabitCompletionHiveModel(habitId: habitId, date: date.dateOnly),
      );
    } else {
      await _completionsBox.delete(key);
    }
  }

  @override
  Stream<Set<String>> watchTodayCompletedIds() async* {
    yield _todayCompletedIds();
    final todaySuffix = '|${formatDateKey(today)}';
    await for (final event in _completionsBox.watch()) {
      if (event.key is String && (event.key as String).endsWith(todaySuffix)) {
        yield _todayCompletedIds();
      }
    }
  }
}
