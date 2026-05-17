// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_completion_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitCompletionHiveModelAdapter
    extends TypeAdapter<HabitCompletionHiveModel> {
  @override
  final typeId = 1;

  @override
  HabitCompletionHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitCompletionHiveModel(
      habitId: fields[0] as String,
      date: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HabitCompletionHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.habitId)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitCompletionHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
