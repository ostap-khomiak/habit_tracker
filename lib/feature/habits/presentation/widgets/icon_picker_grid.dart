import 'package:flutter/material.dart';
import 'package:habit_tracker/core/constants/habit_icons.dart';

class IconPickerGrid extends StatelessWidget {
  final IconData selected;
  final ValueChanged<IconData> onChanged;

  const IconPickerGrid({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: habitIcons.map((icon) {
        final isSelected = icon.codePoint == selected.codePoint;
        return GestureDetector(
          onTap: () => onChanged(icon),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(10),
              border: isSelected
                  ? Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2.5,
                    )
                  : null,
            ),
            child: Icon(
              icon,
              size: 24,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        );
      }).toList(),
    );
  }
}
