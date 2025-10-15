import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/textbook.dart';

mixin TextbookFiles {
  static Future<void> saveTextbook(Textbook textbook) async {
    Data.textbook.put(textbook.catalog, textbook);
  }

  static Textbook? loadTextbook(String catalog) {
    return Data.textbook.get(catalog);
  }
}
