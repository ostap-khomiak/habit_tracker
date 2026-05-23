import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_ce/hive.dart';
import 'package:habit_tracker/core/util/date_utils.dart';
import 'package:habit_tracker/feature/habits/data/mappers/habit_firestore_mapper.dart';
import 'package:habit_tracker/feature/habits/data/mappers/habit_mapper.dart';
import 'package:habit_tracker/feature/habits/data/models/habit_completion_hive_model.dart';
import 'package:habit_tracker/feature/habits/data/models/habit_hive_model.dart';

Future<void> syncFirestoreToHive({
  required String uid,
  required Box<HabitHiveModel> habitsBox,
  required Box<HabitCompletionHiveModel> completionsBox,
}) async {
  final db = FirebaseFirestore.instance;

  final habitsSnap = await db
      .collection('users')
      .doc(uid)
      .collection('habits')
      .get();

  await habitsBox.clear();
  for (final doc in habitsSnap.docs) {
    final habit = HabitFirestoreMapper.fromFirestore(doc);
    await habitsBox.put(habit.id, HabitMapper.toHive(habit));
  }

  final completionsSnap = await db
      .collection('users')
      .doc(uid)
      .collection('completions')
      .get();

  await completionsBox.clear();
  for (final doc in completionsSnap.docs) {
    final data = doc.data();
    final habitId = data['habitId'] as String;
    final date = (data['date'] as Timestamp).toDate().dateOnly;
    final key = '$habitId|${formatDateKey(date)}';
    await completionsBox.put(
      key,
      HabitCompletionHiveModel(habitId: habitId, date: date),
    );
  }
}
