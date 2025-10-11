import 'package:vocabulary/base.dart';

part 'language_type.g.dart';

@HiveType(typeId: 50)
enum LanguageType {
  @HiveField(0)
  english,

  @HiveField(1)
  chinese,
}
