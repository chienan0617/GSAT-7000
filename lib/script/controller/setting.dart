import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/controller/buttons.dart';

class Settings implements Initialable {
  static var theme = MenuButtonController(
    dataName: 'setting:theme',
    values: ['light', 'dark'],
    outFunc: Rebuild.settingsRebuild,
    rebuild: Rebuild.corePageRebuild
  );
  // static var lang = _Lang();
  static var lang = MenuButtonController(
    dataName: 'setting:theme',
    values: ['en', 'zh'],
    rebuild: Rebuild.settingsRebuild,
    extraFunc: (v) => Language.onChangeIndex,
  );

  static void initialize() {}
  static void setup() {}
}
