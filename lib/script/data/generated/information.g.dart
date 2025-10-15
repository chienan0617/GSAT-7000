// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../vocabulary/information.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VocabularyInformationAdapter extends TypeAdapter<VocabularyInformation> {
  @override
  final int typeId = 53;

  @override
  VocabularyInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VocabularyInformation(
      fields[0] as LanguageType,
      fields[1] as VocabularyType,
      fields[2] as String,
      fields[3] as String?,
      (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, VocabularyInformation obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.langType)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.word)
      ..writeByte(3)
      ..write(obj.explanation)
      ..writeByte(4)
      ..write(obj.meanings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VocabularyInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
