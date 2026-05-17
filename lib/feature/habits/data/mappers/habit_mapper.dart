import 'package:habit_tracker/feature/habits/data/models/habit_hive_model.dart';
import 'package:habit_tracker/feature/habits/domain/entities/habit.dart';

class HabitMapper {
  static Habit toDomain(HabitHiveModel m) => Habit(
    id: m.id,
    name: m.name,
    colorValue: m.colorValue,
    iconCodePoint: m.iconCodePoint,
    iconFontFamily: m.iconFontFamily,
    scheduledWeekdays: List<int>.from(m.scheduledWeekdays),
    createdAt: m.createdAt,
  );

  static HabitHiveModel toHive(Habit h) => HabitHiveModel(
    id: h.id,
    name: h.name,
    colorValue: h.colorValue,
    iconCodePoint: h.iconCodePoint,
    iconFontFamily: h.iconFontFamily,
    scheduledWeekdays: List<int>.from(h.scheduledWeekdays),
    createdAt: h.createdAt,
  );
}
