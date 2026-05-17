import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/feature/habits/domain/entities/habit.dart';
import 'package:habit_tracker/feature/stats/presentation/providers/stats_providers.dart';
import 'package:habit_tracker/feature/stats/presentation/widgets/habit_heatmap.dart';

class HabitHeatmapCard extends ConsumerWidget {
  final Habit habit;

  const HabitHeatmapCard({super.key, required this.habit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completionsAsync =
        ref.watch(completionsForHabitProvider(habit.id));
    final habitColor = Color(habit.colorValue);

    return Card(
      margin: const EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  IconData(
                    habit.iconCodePoint,
                    fontFamily: habit.iconFontFamily,
                  ),
                  color: habitColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  habit.name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(height: 12),
            completionsAsync.maybeWhen(
              data: (completions) => HabitHeatmap(
                habitColor: habitColor,
                scheduledWeekdays: habit.scheduledWeekdays.toSet(),
                completions: completions,
              ),
              orElse: () => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
