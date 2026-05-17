extension DateOnlyExtension on DateTime {
  DateTime get dateOnly => DateTime.utc(year, month, day);

  bool isOnWeekday(int weekday) => this.weekday == weekday;
}

DateTime get today => DateTime.now().dateOnly;

// Formats a date-only as "yyyy-MM-dd" for use in Hive
String formatDateKey(DateTime date) =>
    '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
