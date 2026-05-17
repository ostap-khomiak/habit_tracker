// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitHiveModelAdapter extends TypeAdapter<HabitHiveModel> {
  @override
  final typeId = 0;

  @override
  HabitHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitHiveModel(
      id: fields[0] as String,
      name: fields[1] as String,
      colorValue: (fields[2] as num).toInt(),
      iconCodePoint: (fields[3] as num).toInt(),
      iconFontFamily: fields[4] as String,
      scheduledWeekdays: (fields[5] as List).cast<int>(),
      createdAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HabitHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.colorValue)
      ..writeByte(3)
      ..write(obj.iconCodePoint)
      ..writeByte(4)
      ..write(obj.iconFontFamily)
      ..writeByte(5)
      ..write(obj.scheduledWeekdays)
      ..writeByte(6)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
