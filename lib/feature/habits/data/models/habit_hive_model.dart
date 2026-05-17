import 'package:hive_ce/hive.dart';

part 'habit_hive_model.g.dart';

@HiveType(typeId: 0)
class HabitHiveModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int colorValue;

  @HiveField(3)
  final int iconCodePoint;

  @HiveField(4)
  final String iconFontFamily;

  // values are DateTime.weekday (1=Mon..7=Sun)
  @HiveField(5)
  final List<int> scheduledWeekdays;

  @HiveField(6)
  final DateTime createdAt;

  HabitHiveModel({
    required this.id,
    required this.name,
    required this.colorValue,
    required this.iconCodePoint,
    required this.iconFontFamily,
    required this.scheduledWeekdays,
    required this.createdAt,
  });
}
