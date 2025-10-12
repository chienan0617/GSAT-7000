// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customize.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VocabularyCustomizeAdapter extends TypeAdapter<VocabularyCustomize> {
  @override
  final int typeId = 54;

  @override
  VocabularyCustomize read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VocabularyCustomize(
      fields[0] as bool,
      fields[2] as bool,
      fields[1] as int,
      fields[3] as DateTime?,
      fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VocabularyCustomize obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.stared)
      ..writeByte(1)
      ..write(obj.familiarity)
      ..writeByte(2)
      ..write(obj.done)
      ..writeByte(3)
      ..write(obj.finishTime)
      ..writeByte(4)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VocabularyCustomizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
