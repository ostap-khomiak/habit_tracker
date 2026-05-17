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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _days.map(((int, String) entry) {
        final (day, label) = entry;
        final isSelected = selected.contains(day);
        return FilterChip(
          label: Text(label),
          selected: isSelected,
          onSelected: (checked) {
            final next = List<int>.from(selected);
            if (checked) {
              next
                ..add(day)
                ..sort();
            } else {
              next.remove(day);
            }
            onChanged(next);
          },
        );
      }).toList(),
    );
  }
}
