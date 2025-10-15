import 'package:vocabulary/base.dart';

part '../generated/usage.g.dart';

@HiveType(typeId: 52)
class VocabularyUsage {
  @HiveField(0)
  final List<String>? synonyms;

  @HiveField(1)
  final List<String>? antonyms;

  @HiveField(2)
  final List<String>? extensions;

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
