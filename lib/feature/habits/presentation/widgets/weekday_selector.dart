import 'package:flutter/material.dart';

class WeekdaySelector extends StatelessWidget {
  final List<int> selected;
  final ValueChanged<List<int>> onChanged;

  const WeekdaySelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  static const _days = [
    (1, 'M'),
    (2, 'T'),
    (3, 'W'),
    (4, 'T'),
    (5, 'F'),
    (6, 'S'),
    (7, 'S'),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _days.map(((int, String) entry) {
        final (day, label) = entry;
        final isSelected = selected.contains(day);
        return Expanded(
          child: GestureDetector(
            onTap: () {
              final next = List<int>.from(selected);
              if (isSelected) {
                next.remove(day);
              } else {
                next
                  ..add(day)
                  ..sort();
              }
              onChanged(next);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: AspectRatio(
                aspectRatio: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.surfaceContainerHighest,
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? colorScheme.onPrimary
                            : colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
