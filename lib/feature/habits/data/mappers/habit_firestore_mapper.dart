import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_tracker/feature/habits/domain/entities/habit.dart';

class HabitFirestoreMapper {
  static Map<String, dynamic> toFirestore(Habit habit) => {
    'name': habit.name,
    'colorValue': habit.colorValue,
    'iconCodePoint': habit.iconCodePoint,
    'iconFontFamily': habit.iconFontFamily,
    'scheduledWeekdays': habit.scheduledWeekdays,
    'createdAt': Timestamp.fromDate(habit.createdAt),
  };

  static Habit fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return Habit(
      id: doc.id,
      name: data['name'] as String,
      colorValue: data['colorValue'] as int,
      iconCodePoint: data['iconCodePoint'] as int,
      iconFontFamily: data['iconFontFamily'] as String,
      scheduledWeekdays: List<int>.from(data['scheduledWeekdays'] as List),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}
