import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:habit_tracker/core/constants/habit_colors.dart';
import 'package:habit_tracker/core/constants/habit_icons.dart';
import 'package:habit_tracker/feature/habits/domain/entities/habit.dart';
import 'package:habit_tracker/feature/habits/presentation/providers/habits_providers.dart';
import 'color_picker_grid.dart';
import 'icon_picker_grid.dart';
import 'weekday_selector.dart';

class AddHabitSheet extends ConsumerStatefulWidget {
  const AddHabitSheet({super.key});

  @override
  ConsumerState<AddHabitSheet> createState() => _AddHabitSheetState();
}

class _AddHabitSheetState extends ConsumerState<AddHabitSheet> {
  final _nameController = TextEditingController();
  List<int> _weekdays = List<int>.from([1, 2, 3, 4, 5, 6, 7]);
  Color _color = habitColors.first;
  IconData _icon = habitIcons.first;

  bool get _canSave =>
      _nameController.text.trim().isNotEmpty && _weekdays.isNotEmpty;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_canSave) return;
    final habit = Habit(
      id: const Uuid().v4(),
      name: _nameController.text.trim(),
      // ignore: deprecated_member_use
      colorValue: _color.value,
      iconCodePoint: _icon.codePoint,
      iconFontFamily: _icon.fontFamily ?? 'MaterialIcons',
      scheduledWeekdays: _weekdays,
      createdAt: DateTime.now().toUtc(),
    );
    await ref.read(habitsRepositoryProvider).addHabit(habit);
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            Text('New habit', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),

            TextField(
              controller: _nameController,
              autofocus: true,
              maxLength: 40,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                counterText: '',
              ),
              onChanged: (_) => setState(() {}),
              onSubmitted: (_) => _save(),
            ),
            const SizedBox(height: 20),

            Text('Repeat on', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 10),
            WeekdaySelector(
              selected: _weekdays,
              onChanged: (v) => setState(() => _weekdays = v),
            ),
            const SizedBox(height: 20),

            Text('Color', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 10),
            ColorPickerGrid(
              selected: _color,
              onChanged: (v) => setState(() => _color = v),
            ),
            const SizedBox(height: 20),

            Text('Icon', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 10),
            IconPickerGrid(
              selected: _icon,
              onChanged: (v) => setState(() => _icon = v),
            ),
            const SizedBox(height: 28),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: _canSave ? _save : null,
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
