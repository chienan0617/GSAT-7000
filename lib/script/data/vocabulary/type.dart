import 'package:vocabulary/base.dart';

part '../generated/type.g.dart';

@HiveType(typeId: 51)
enum VocabularyType {
  @HiveField(0)
  noun,

  @HiveField(1)
  verb,

  @HiveField(2)
  adj,

  @HiveField(3)
  adv,

  @HiveField(4)
  prep,

  @HiveField(5)
  conj,
}
