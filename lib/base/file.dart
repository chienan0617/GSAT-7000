import 'package:vocabulary/base.dart';

class FileHandle {
  static Map data = {};

  static Future<dynamic> getTemplate(String name, String fileName) async {
    if (data[name] == null) {
      data[name] = jsonDecode(
        await rootBundle.loadString('assets/document/$fileName.json'),
      );
    }
    return data[name];
  }

  @method
  static Future<Map<String, dynamic>> getRegister(String name) async {
    return (await getTemplate('register', 'register') as Map)[name];
  }

  @method
  static Future<Map> getLanguageWord(String lang) async {
    return (await getTemplate('language', 'language/$lang') as Map);
  }

  @method
  static Future<Map<String, dynamic>> getTutorialKeys() async {
    return (await getTemplate('tutorial', 'tutorial/tutorial'));
  }

  @method
  static Future<Map> getTutorialKeysLang(String lang) async {
    return (await getTemplate('tutorialLang', 'tutorial/$lang'));
  }

  @method
  static Future<List> getColors(String lang) async {
    return (await getTemplate('color', 'color'))[lang];
  }

  @method
  static Future<Map> getSystem() async {
    return (await getTemplate('system', 'system'));
  }

  static Future<dynamic> get(String key) async {}
}
