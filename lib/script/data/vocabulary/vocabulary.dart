import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/vocabulary/customize.dart';
import 'package:vocabulary/script/data/vocabulary/information.dart';
import 'package:vocabulary/script/data/vocabulary/usage.dart';
import 'package:vocabulary/script/mixin/vocabulary.dart';

part 'vocabulary.g.dart';

@HiveType(typeId: 49)
class Vocabulary with VocabularyUtil {
  @HiveField(0)
  final VocabularyInformation info;

  @HiveField(1)
  final VocabularyCustomize customize;

  @HiveField(3)
  final VocabularyUsage usage;

  const Vocabulary(
    this.info,
    this.customize,
    this.usage,
  );
}
