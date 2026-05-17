import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit.freezed.dart';

@freezed
abstract class Habit with _$Habit {
  const factory Habit({
    required String id,
    required String name,
    required int colorValue,
    required int iconCodePoint,
    required String iconFontFamily,

    // DateTime.weekday values: 1=Mon .. 7=Sun
    required List<int> scheduledWeekdays,
    required DateTime createdAt,
  }) = _Habit;
}
