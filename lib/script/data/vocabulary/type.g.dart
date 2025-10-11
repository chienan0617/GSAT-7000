// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VocabularyTypeAdapter extends TypeAdapter<VocabularyType> {
  @override
  final int typeId = 51;

  @override
  VocabularyType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return VocabularyType.noun;
      case 1:
        return VocabularyType.verb;
      case 2:
        return VocabularyType.adj;
      case 3:
        return VocabularyType.adv;
      case 4:
        return VocabularyType.prep;
      case 5:
        return VocabularyType.conj;
      default:
        return VocabularyType.noun;
    }
  }

  @override
  void write(BinaryWriter writer, VocabularyType obj) {
    switch (obj) {
      case VocabularyType.noun:
        writer.writeByte(0);
        break;
      case VocabularyType.verb:
        writer.writeByte(1);
        break;
      case VocabularyType.adj:
        writer.writeByte(2);
        break;
      case VocabularyType.adv:
        writer.writeByte(3);
        break;
      case VocabularyType.prep:
        writer.writeByte(4);
        break;
      case VocabularyType.conj:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VocabularyTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
