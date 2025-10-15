import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/vocabulary/vocabulary.dart';
import 'package:vocabulary/script/mixin/textbook.dart';
import 'package:vocabulary/script/mixin/textbook/textbook_decoder.dart';
import 'package:vocabulary/script/mixin/textbook/textbook_encoder.dart';

part 'generated/textbook.g.dart';

@HiveType(typeId: 48)
class Textbook with TextbookUtils, TextbookEncoder, TextbookDecoder {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<Vocabulary> voc;

  @HiveField(2)
  final DateTime createTime;

  @HiveField(3)
  final String catalog;

  const Textbook(this.name, this.voc, this.createTime, this.catalog);
}
