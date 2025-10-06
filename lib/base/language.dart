import 'package:vocabulary/base.dart';

class Language implements Initialable {
  static Map words = {};
  static List<String> langList = ['en', 'zh'];
  static int langIndex = Data.app.get<int>('language');
  static String langName = langList[langIndex];

  static Future<void> initialize() async {
    words[langName] = await FileHandle.getLanguageWord(langName);
  }

  static String word(String text) {
    return words[langName][text] ?? System.error;
  }

  static Future<void> onChangeIndex(int newIndex) async {
    langIndex = newIndex;
    Data.app.put<int>('language', newIndex);

    await initialize();
  }
}

word(String text) => Language.word(text);
