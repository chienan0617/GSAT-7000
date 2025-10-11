import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/vocabulary/vocabulary.dart';
import 'package:vocabulary/script/mixin/textbook.dart';

part 'textbook.g.dart';

@HiveType(typeId: 48)
class Textbook with TextbookUtil {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final Map<String, Vocabulary> voc;

  @HiveField(2)
  final DateTime createTime;

  @HiveField(3)

  const Textbook(this.name, this.voc, this.createTime);
}
