import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/unit.dart';
import 'package:vocabulary/script/mixin/textbook/textbook.dart';
import 'package:vocabulary/script/mixin/textbook/textbook_decoder.dart';
import 'package:vocabulary/script/mixin/textbook/textbook_encoder.dart';

part 'generated/textbook.g.dart';

@HiveType(typeId: 48)
class Textbook with TextbookUtils, TextbookEncoder, TextbookDecoder {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<Unit> units;

  @HiveField(2)
  final DateTime createTime;

  const Textbook(this.name, this.units, this.createTime);
}
