import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/vocabulary/language_type.dart';
import 'package:vocabulary/script/data/vocabulary/type.dart';

part '../generated/information.g.dart';

@HiveType(typeId: 53)
class VocabularyInformation {
  @HiveField(0)
  final LanguageType langType;

  @HiveField(1)
  final VocabularyType type;

  @HiveField(2)
  final String word;

  @HiveField(3)
  final String? explanation;

  @HiveField(4) // * words 對應到 lang type index
  final List<String> meanings;

  VocabularyInformation(
    this.langType,
    this.type,
    this.word,
    this.explanation,
    this.meanings,
  );
}
