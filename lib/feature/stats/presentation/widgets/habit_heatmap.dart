import 'package:flutter/material.dart';

class HabitHeatmap extends StatelessWidget {
  final Color habitColor;
  final Set<int> scheduledWeekdays;
  final Set<DateTime> completions;
  final double cellGap;

  const HabitHeatmap({
    super.key,
    required this.habitColor,
    required this.scheduledWeekdays,
    required this.completions,
    this.cellGap = 3,
  });

  static const _dayLabels = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // UTC dates to match dateOnly extension in date_utils.dart
    final now = DateTime.now();
    final todayOnly = DateTime.utc(now.year, now.month, now.day);
    final firstOfMonth = DateTime.utc(now.year, now.month, 1);
    final lastOfMonth =
        DateTime.utc(now.year, now.month + 1, 1).subtract(const Duration(days: 1));

    final startMonday =
        firstOfMonth.subtract(Duration(days: firstOfMonth.weekday - 1));
    final endSunday = lastOfMonth.weekday == 7
        ? lastOfMonth
        : lastOfMonth.add(Duration(days: 7 - lastOfMonth.weekday));

    final weeksCount = endSunday.difference(startMonday).inDays ~/ 7 + 1;

    return LayoutBuilder(
      builder: (context, constraints) {
        // 7 columns — one per day of week
        final rawSize = (constraints.maxWidth - cellGap * 6) / 7;
        final cellSize = rawSize.clamp(6.0, 28.0);

        final labelStyle = TextStyle(
          fontSize: 7,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurfaceVariant,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Day-of-week header row
            Row(
              children: List.generate(7, (dayIndex) {
                return Padding(
                  padding: EdgeInsets.only(right: dayIndex < 6 ? cellGap : 0),
                  child: SizedBox(
                    width: cellSize,
                    child: Text(
                      _dayLabels[dayIndex],
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: labelStyle,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: cellGap),
            // One row per week
            ...List.generate(weeksCount, (weekIndex) {
              return Padding(
                padding:
                    EdgeInsets.only(bottom: weekIndex < weeksCount - 1 ? cellGap : 0),
                child: Row(
                  children: List.generate(7, (dayIndex) {
                    final date = startMonday
                        .add(Duration(days: weekIndex * 7 + dayIndex));
                    // dayIndex 0 = Monday (DateTime.weekday 1)
                    final weekday = dayIndex + 1;

                    final isFuture = date.isAfter(todayOnly);
                    final isScheduled = scheduledWeekdays.contains(weekday);
                    final isComplete = completions.contains(date);

                    final Color cellColor;
                    final BoxBorder? border;
                    if (!isScheduled || isFuture) {
                      // ignore: deprecated_member_use
                      cellColor = colorScheme.onSurface.withOpacity(0.12);
                      border = null;
                    } else if (isComplete) {
                      cellColor = habitColor;
                      border = null;
                    } else {
                      cellColor = colorScheme.surfaceContainerHighest;
                      border = Border.all(
                        color: colorScheme.outlineVariant,
                        width: 0.5,
                      );
                    }

                    return Padding(
                      padding:
                          EdgeInsets.only(right: dayIndex < 6 ? cellGap : 0),
                      child: SizedBox(
                        width: cellSize,
                        height: cellSize,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: cellColor,
                            borderRadius: BorderRadius.circular(2),
                            border: border,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
