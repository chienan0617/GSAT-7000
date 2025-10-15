import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/textbook.dart';
import 'package:vocabulary/script/data/vocabulary/vocabulary.dart';
import 'package:vocabulary/script/mixin/vocabulary/vocabulary_decoder.dart';

mixin TextbookDecoder {
  static Future<Textbook> decodeTextbookFromFile(String path) async {
    ByteData data = await rootBundle.load(path);
    List<int> bytes = data.buffer.asUint8List();

    String text = utf8.decode(gZipDecoder.decodeBytes(bytes));

    return decodeTextbookFromDecodedString(text);
  }

  static Textbook decodeTextbookFromDecodedString(String source) {
    final List<String> sep = source.split('&');

    List<dynamic> j = [sep[0], _getVocs(sep[1]), _getTime(sep[2]), sep[3]];

    return Textbook(j[0], j[1], j[2], j[3]);
  }

  static List<Vocabulary> _getVocs(String source) {
    final List<String> secs = source.split(';');
    List<Vocabulary> voc = [];

    for (var sec in secs) {
      voc.add(VocabularyDecoder.decodeVocFromDecodedString(sec));
    }

    return voc;
  }

  static DateTime _getTime(String source) {
    return DateTime.parse(source);
  }
}
