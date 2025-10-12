import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/vocabulary/customize.dart';
import 'package:vocabulary/script/data/vocabulary/information.dart';
import 'package:vocabulary/script/data/vocabulary/language_type.dart';
import 'package:vocabulary/script/data/vocabulary/type.dart';
import 'package:vocabulary/script/data/vocabulary/usage.dart';
import 'package:vocabulary/script/data/vocabulary/vocabulary.dart';
import 'package:archive/archive.dart';

mixin VocabularyDecoder {
  static final gZipDecoder = GZipDecoder();

  static Future<Vocabulary> decodeVocFromFile(String path) async {
    ByteData data = await rootBundle.load(path);
    List<int> bytes = data.buffer.asUint8List();

    String text = utf8.decode(gZipDecoder.decodeBytes(bytes));

    return decodeVocFromDecodedString(text);
  }

  static Vocabulary decodeVocFromDecodedString(String source) {
    final List<String> sep = source.split(",");

    List<dynamic> j = [
      // *
      _getLangType(sep[0]),
      _getVocType(sep[1]),
      sep[2],
      sep[3],
      (sep[4] as List).cast<String>(),
      // *
      (sep[5] as List).cast<String>(),
      (sep[6] as List).cast<String>(),
      (sep[6] as List).cast<String>(),
      sep[7],
      (sep[8] as List).cast<String>(),
    ];

    // handle
    final info = VocabularyInformation(j[0], j[1], j[2], j[3], j[4]);
    final customize = VocabularyCustomize(false, false, 0, null, null);
    final usage = VocabularyUsage(j[5], j[6], j[7], j[8], j[9]);

    return Vocabulary(info, customize, usage);
  }

  static LanguageType _getLangType(String type) {
    return switch (type) {
      'c' => LanguageType.chinese,
      'e' => LanguageType.english,
      _ => throw ArgumentError('Unknown language: $type'),
    };
  }

  static VocabularyType _getVocType(String type) {
    return switch (type) {
      'n' => VocabularyType.noun,
      'v' => VocabularyType.verb,
      'a' => VocabularyType.adj,
      'd' => VocabularyType.adv,
      'p' => VocabularyType.prep,
      'c' => VocabularyType.conj,
      _ => throw ArgumentError('Unknown type: $type'),
    };
  }
}
