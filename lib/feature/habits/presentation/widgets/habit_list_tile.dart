import 'package:flutter/material.dart';
import 'package:habit_tracker/core/util/date_utils.dart';
import 'package:habit_tracker/feature/habits/domain/entities/habit.dart';

class HabitListTile extends StatelessWidget {
  final Habit habit;
  final bool isDoneToday;
  final ValueChanged<bool> onToggle;

  const HabitListTile({
    super.key,
    required this.habit,
    required this.isDoneToday,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final color = Color(habit.colorValue);
    final isScheduledToday = habit.scheduledWeekdays.contains(today.weekday);

    return ListTile(
      leading: CircleAvatar(
        // ignore: deprecated_member_use
        backgroundColor: color.withOpacity(0.15),
        child: Icon(
          IconData(habit.iconCodePoint, fontFamily: habit.iconFontFamily),
          color: color,
          size: 22,
        ),
      ),
      title: Text(habit.name),
      subtitle: Text(_weekdayLabel(habit.scheduledWeekdays)),
      trailing: Checkbox(
        value: isDoneToday,
        activeColor: color,
        onChanged: isScheduledToday ? (v) => onToggle(v ?? false) : null,
      ),
    );
  }

  String _weekdayLabel(List<int> days) {
    if (days.length == 7) return 'Every day';
    const names = ['', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days.map((d) => names[d]).join(' · ');
  }
}
