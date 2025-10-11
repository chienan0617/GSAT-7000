import 'package:vocabulary/base.dart';

part 'customize.g.dart';

@HiveType(typeId: 54)
class VocabularyCustomize {
  @HiveField(0)
  final bool stared;

  @HiveField(1)
  final int familiarity;

  @HiveField(2)
  final bool done;

  @HiveField(3)
  final DateTime finishTime;

  @HiveField(4)
  final String note;

  VocabularyCustomize(
    this.stared,
    this.done,
    this.familiarity,
    this.finishTime,
    this.note
  );
}
