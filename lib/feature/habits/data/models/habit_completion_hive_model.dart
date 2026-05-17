import 'package:hive_ce/hive.dart';

part 'habit_completion_hive_model.g.dart';

@HiveType(typeId: 1)
class HabitCompletionHiveModel {
  @HiveField(0)
  final String habitId;

  @HiveField(1)
  final DateTime date;

  HabitCompletionHiveModel({required this.habitId, required this.date});
}
