import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/vocabulary/vocabulary.dart';
import 'package:vocabulary/script/mixin/unit/unit.dart';
import 'package:vocabulary/script/mixin/unit/unit_decoder.dart';
import 'package:vocabulary/script/mixin/unit/unit_encoder.dart';

part 'generated/unit.g.dart';

@HiveType(typeId: 55)
class Unit with UnitUtils, UnitEncoder, UnitDecoder {
  @HiveField(0)
  final int num;

  @HiveField(1)
  final List<Vocabulary> voc;

  Unit(this.num, this.voc);
}
