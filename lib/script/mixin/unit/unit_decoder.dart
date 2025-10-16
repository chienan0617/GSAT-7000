import 'package:vocabulary/script/data/unit.dart';
import 'package:vocabulary/script/data/vocabulary/vocabulary.dart';
import 'package:vocabulary/script/mixin/vocabulary/vocabulary_decoder.dart';

mixin UnitDecoder {
  static Unit decodeUnitFromDecodedString(String source) {
    List<dynamic> j = [
      _getNum(),
      _getVocs(source),
    ];

    return Unit(j[0], j[1]);
  }

  static List<Vocabulary> _getVocs(String source) {
    final List<String> secs = source.split('&');
    List<Vocabulary> vocs = [];

    for (var sec in secs) {
      vocs.add(VocabularyDecoder.decodeVocFromDecodedString(sec));
    }
    return vocs;
  }

  static int _getNum() {
    return 1;
  }
}
