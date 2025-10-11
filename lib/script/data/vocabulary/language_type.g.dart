// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguageTypeAdapter extends TypeAdapter<LanguageType> {
  @override
  final int typeId = 50;

  @override
  LanguageType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LanguageType.english;
      case 1:
        return LanguageType.chinese;
      default:
        return LanguageType.english;
    }
  }

  @override
  void write(BinaryWriter writer, LanguageType obj) {
    switch (obj) {
      case LanguageType.english:
        writer.writeByte(0);
        break;
      case LanguageType.chinese:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
