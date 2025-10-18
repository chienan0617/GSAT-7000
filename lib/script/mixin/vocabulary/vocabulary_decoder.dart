import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/vocabulary/customize.dart';
import 'package:vocabulary/script/data/vocabulary/information.dart';
import 'package:vocabulary/script/data/vocabulary/language_type.dart';
import 'package:vocabulary/script/data/vocabulary/type.dart';
import 'package:vocabulary/script/data/vocabulary/usage.dart';
import 'package:vocabulary/script/data/vocabulary/vocabulary.dart';

mixin VocabularyDecoder {
  static Future<Vocabulary> decodeVocFromFile(String path) async {
    ByteData data = await rootBundle.load(path);
    List<int> bytes = data.buffer.asUint8List();

    String text = utf8.decode(gZipDecoder.decodeBytes(bytes));

    return decodeVocFromDecodedString(text);
  }

  static Vocabulary decodeVocFromDecodedString(String source) {
    final List<String> sep = source.split("\\");

    List<dynamic> j = [
      // *
      _getLangType(sep[0]),
      _getVocType(sep[1]),
      sep[2],
      sep[3],
      _spilt(sep[4]),
      // *
      _spilt(sep[5]),
      _spilt(sep[6]),
      _spilt(sep[7]),
      sep[8],
      _spilt(sep[9]),
      _spiltTrans(sep[10]),
    ];

    // handle
    final info = VocabularyInformation(j[0], j[1], j[2], j[3], j[4]);
    final customize = VocabularyCustomize(false, false, 0, null, null);
    final usage = VocabularyUsage(j[5], j[6], j[7], j[8], j[9], j[10]);

    return Vocabulary(info, customize, usage);
  }

  static List<String> _spilt(String sou) {
    return sou.split('/').toList();
  }

  static List<List<String>> _spiltTrans(String sou) {
    List<List<String>> returned = [];
    final list = _spilt(sou);

    for (var e in list) {
      returned.add(e.split('%'));
    }
    return returned;
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
