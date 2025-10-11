// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textbook.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TextbookAdapter extends TypeAdapter<Textbook> {
  @override
  final int typeId = 48;

  @override
  Textbook read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Textbook(
      fields[0] as String,
      (fields[1] as Map).cast<String, Vocabulary>(),
      fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Textbook obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.voc)
      ..writeByte(2)
      ..write(obj.createTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextbookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
