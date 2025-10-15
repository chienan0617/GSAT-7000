import 'package:vocabulary/base.dart';

class Theme implements Initialable {
  static Map<String, Vector2<Color>> themes = {};

  @initial
  static Future<void> initialize() async {}

  static void register(Vector2<Color> theme, String name) {
    themes[name] = theme;
  }
}

theme(String name) => Theme.themes[name];
