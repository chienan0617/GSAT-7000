import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/vocabulary/vocabulary.dart';

part 'usage.g.dart';

@HiveType(typeId: 52)
class VocabularyUsage {
  @HiveField(0)
  final List<Vocabulary>? synonyms;

  @HiveField(1)
  final List<Vocabulary>? antonyms;

  @HiveField(2)
  final List<Vocabulary>? extensions;

  @HiveField(3)
  final String? collocation;

  @HiveField(4)
  final List<String> examples;

  VocabularyUsage(
    this.synonyms,
    this.antonyms,
    this.extensions,
    this.collocation,
    this.examples
  );
}
