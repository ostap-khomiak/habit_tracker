import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_tracker/core/util/date_utils.dart';
import 'package:habit_tracker/feature/habits/data/mappers/habit_firestore_mapper.dart';
import 'package:habit_tracker/feature/habits/domain/entities/habit.dart';
import 'package:habit_tracker/feature/habits/domain/repositories/habits_repository.dart';

class FirestoreHabitsRepository implements HabitsRepository {
  final String uid;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  FirestoreHabitsRepository({required this.uid});

  CollectionReference<Map<String, dynamic>> get _habitsCol =>
      _db.collection('users').doc(uid).collection('habits');

  CollectionReference<Map<String, dynamic>> get _completionsCol =>
      _db.collection('users').doc(uid).collection('completions');

  @override
  Stream<List<Habit>> watchHabits() => _habitsCol.snapshots().map((snap) {
    final habits = snap.docs.map(HabitFirestoreMapper.fromFirestore).toList();
    habits.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return habits;
  });

  @override
  Future<void> addHabit(Habit habit) =>
      _habitsCol.doc(habit.id).set(HabitFirestoreMapper.toFirestore(habit));

  @override
  Future<void> deleteHabit(String id) async {
    await _habitsCol.doc(id).delete();
    final completions = await _completionsCol
        .where('habitId', isEqualTo: id)
        .get();
    if (completions.docs.isEmpty) return;
    final batch = _db.batch();
    for (final doc in completions.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }

  @override
  Stream<Set<DateTime>> watchCompletions(String habitId) => _completionsCol
      .where('habitId', isEqualTo: habitId)
      .snapshots()
      .map(
        (snap) => snap.docs
            .map((doc) => (doc.data()['date'] as Timestamp).toDate().dateOnly)
            .toSet(),
      );

  @override
  Future<void> setCompletion(String habitId, DateTime date, bool done) async {
    final docId = '${habitId}_${formatDateKey(date.dateOnly)}';
    final ref = _completionsCol.doc(docId);
    if (done) {
      await ref.set({
        'habitId': habitId,
        'date': Timestamp.fromDate(date.dateOnly),
      });
    } else {
      await ref.delete();
    }
  }

  @override
  Stream<Set<String>> watchTodayCompletedIds() {
    final todayTimestamp = Timestamp.fromDate(today);
    return _completionsCol
        .where('date', isEqualTo: todayTimestamp)
        .snapshots()
        .map(
          (snap) =>
              snap.docs.map((doc) => doc.data()['habitId'] as String).toSet(),
        );
  }
}
