import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/vocabulary/customize.dart';
import 'package:vocabulary/script/data/vocabulary/information.dart';
import 'package:vocabulary/script/data/vocabulary/usage.dart';
import 'package:vocabulary/script/mixin/vocabulary.dart';
import 'package:vocabulary/script/mixin/vocabulary/vocabulary_decoder.dart';
import 'package:vocabulary/script/mixin/vocabulary/vocabulary_encoder.dart';

part '../generated/vocabulary.g.dart';

@HiveType(typeId: 49)
class Vocabulary with VocabularyUtils, VocabularyEncoder, VocabularyDecoder {
  @HiveField(0)
  final VocabularyInformation info;

  @HiveField(1)
  final VocabularyCustomize cust;

  @HiveField(3)
  final VocabularyUsage usage;

  const Vocabulary(
    this.info,
    this.cust,
    this.usage,
  );
}
