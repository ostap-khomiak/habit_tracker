import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_ce/hive.dart';
import 'package:habit_tracker/core/util/date_utils.dart';
import 'package:habit_tracker/feature/habits/data/mappers/habit_firestore_mapper.dart';
import 'package:habit_tracker/feature/habits/data/mappers/habit_mapper.dart';
import 'package:habit_tracker/feature/habits/data/models/habit_completion_hive_model.dart';
import 'package:habit_tracker/feature/habits/data/models/habit_hive_model.dart';

Future<void> migrateIfNeeded({
  required String uid,
  required Box<HabitHiveModel> habitsBox,
  required Box<HabitCompletionHiveModel> completionsBox,
}) async {
  final db = FirebaseFirestore.instance;
  final metaRef = db
      .collection('users')
      .doc(uid)
      .collection('_meta')
      .doc('migration');

  try {
    final metaDoc = await metaRef.get();
    if (metaDoc.exists) return;
  } on FirebaseException catch (e) {
    if (e.code == 'unavailable') {
      try {
        final cached = await metaRef.get(
          const GetOptions(source: Source.cache),
        );
        if (cached.exists) return;
      } catch (_) {
        // no cached value
      }
    } else {
      rethrow;
    }
  }

  final batch = db.batch();

  for (final model in habitsBox.values) {
    final habit = HabitMapper.toDomain(model);
    final ref = db
        .collection('users')
        .doc(uid)
        .collection('habits')
        .doc(habit.id);
    batch.set(ref, HabitFirestoreMapper.toFirestore(habit));
  }

  for (final model in completionsBox.values) {
    final docId = '${model.habitId}_${formatDateKey(model.date)}';
    final ref = db
        .collection('users')
        .doc(uid)
        .collection('completions')
        .doc(docId);
    batch.set(ref, {
      'habitId': model.habitId,
      'date': Timestamp.fromDate(model.date),
    });
  }

  batch.set(metaRef, {'migratedAt': FieldValue.serverTimestamp()});
  await batch.commit();
}
