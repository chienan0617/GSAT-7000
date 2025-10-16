import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/textbook.dart';
import 'package:vocabulary/script/data/unit.dart';
import 'package:vocabulary/script/mixin/unit/unit_decoder.dart';

mixin TextbookDecoder {
  static Future<Textbook> decodeTextbookFromFile(String path) async {
    ByteData data = await rootBundle.load(path);
    List<int> bytes = data.buffer.asUint8List();

    String text = utf8.decode(gZipDecoder.decodeBytes(bytes));

    return decodeTextbookFromDecodedString(text);
  }

  static Textbook decodeTextbookFromDecodedString(String source) {
    final List<String> sep = source.split('&');
    List<dynamic> j = [sep[0], _getUnits(sep[1]), _getTime(sep[2]), sep[3]];

    return Textbook(j[0], j[1], j[2], j[3]);
  }

  static List<Unit> _getUnits(String source) {
    final List<String> secs = source.split('\$');
    List<Unit> units = [];

    for (var sec in secs) {
      units.add(UnitDecoder.decodeUnitFromDecodedString(sec));
    }

    return units;
  }

  static DateTime _getTime(String source) {
    return DateTime.parse(source);
  }
}
