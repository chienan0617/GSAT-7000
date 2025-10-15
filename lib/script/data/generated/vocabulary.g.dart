// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../vocabulary/vocabulary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VocabularyAdapter extends TypeAdapter<Vocabulary> {
  @override
  final int typeId = 49;

  @override
  Vocabulary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vocabulary(
      fields[0] as VocabularyInformation,
      fields[1] as VocabularyCustomize,
      fields[3] as VocabularyUsage,
    );
  }

  @override
  void write(BinaryWriter writer, Vocabulary obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.info)
      ..writeByte(1)
      ..write(obj.cust)
      ..writeByte(3)
      ..write(obj.usage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VocabularyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
