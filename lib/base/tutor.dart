import 'package:vocabulary/base.dart';

class Tutorial implements Initialable {
  static final Map<String, TutorialCoachMark> tutorials = {};
  static final Map<String, GlobalKey> globalKeys = {};
  static final Map<String, dynamic> words = {};
  static final String langName = Language.langName;

  static Future<void> initialize() async {
    await _initTutorialFile();
  }

  static Future<void> _initTutorialFile() async {
    words[langName] = await FileHandle.getTutorialKeysLang(langName);
    final data = await FileHandle.getTutorialKeys();

    for (var entry in data.entries) {
      final moduleName = entry.key;
      final stepsMap = Map<String, dynamic>.from(entry.value);

      _createKeys(moduleName, stepsMap);
      final targets = _buildTargets(moduleName, stepsMap);

      tutorials[moduleName] = TutorialCoachMark(
        targets: targets,
        colorShadow: textColor,
        opacityShadow: 0.7,
        textSkip: words[langName]['skip'] ?? '跳過',
        alignSkip: Alignment.topRight,
        focusAnimationDuration: Duration(milliseconds: 600),
        pulseAnimationDuration: Duration(milliseconds: 500),
        useSafeArea: true,
        onFinish: () {
          debugPrint('$moduleName tutorial finish');
        },
        textStyleSkip: TextStyle(
          color: textColorP,
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
        onSkip: () => true,
      );
    }

    // log('GlobalKeys: $globalKeys');
    // log('Tutorials: ${tutorials.keys}');
  }

  static void _createKeys(String moduleName, Map<String, dynamic> steps) {
    for (var step in steps.keys) {
      final fullKey = step.contains(':') ? step : '$moduleName:$step';
      globalKeys[fullKey] = GlobalKey();
    }
  }

  static List<TargetFocus> _buildTargets(
    String moduleName,
    Map<String, dynamic> steps,
  ) {
    final List<TargetFocus> list = [];

    for (var entry in steps.entries) {
      final rawStep = entry.key;
      final fullKey = rawStep.contains(':') ? rawStep : '$moduleName:$rawStep';
      final config = List<dynamic>.from(entry.value);
      // 0: ContentAlign 索引, 1: 文案 key, 2: shape type (0 圓形,1 圓角矩形), 3: radius (若為圓角矩形)
      final align = ContentAlign.values[config[0] as int];
      final textKey = config[1] as String;
      final intro = words[langName][textKey] as String;
      final shapeType = config.length >= 3 ? config[2] as int : 0;
      final radius = config.length >= 4 ? (config[3] as num).toDouble() : 8.0;
      final shape = shapeType == 0 ? ShapeLightFocus.Circle : ShapeLightFocus.RRect;

      list.add(
        TargetFocus(
          keyTarget: globalKeys[fullKey]!,
          identify: fullKey,
          shape: shape,
          radius: radius,
          paddingFocus: 8,
          enableOverlayTab: true,
          contents: [
            TargetContent(
              align: align,
              builder: (context, controller) => Text(
                intro,
                style: TextStyle(
                  color: textColorP,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return list;
  }

  static GlobalKey getKey(String module, String step) =>
      globalKeys['$module:$step']!;

  static void showTutorial(BuildContext context, String moduleName) {
    if (Data.app.get('tutorial:$moduleName')) return;

    final tutorial = tutorials[moduleName];
    if (tutorial != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        tutorial.show(context: context);
      });
    }

    Data.app.put('tutorial:$moduleName', true);
  }
}
