// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../vocabulary/usage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VocabularyUsageAdapter extends TypeAdapter<VocabularyUsage> {
  @override
  final int typeId = 52;

  @override
  VocabularyUsage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VocabularyUsage(
      (fields[0] as List?)?.cast<String>(),
      (fields[1] as List?)?.cast<String>(),
      (fields[2] as List?)?.cast<String>(),
      fields[3] as String?,
      (fields[4] as List).cast<String>(),
      (fields[5] as List).cast<List<String>>(),
    );
  }

  @override
  void write(BinaryWriter writer, VocabularyUsage obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.synonyms)
      ..writeByte(1)
      ..write(obj.antonyms)
      ..writeByte(2)
      ..write(obj.extensions)
      ..writeByte(3)
      ..write(obj.collocation)
      ..writeByte(4)
      ..write(obj.examples)
      ..writeByte(5)
      ..write(obj.exaTran);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VocabularyUsageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
