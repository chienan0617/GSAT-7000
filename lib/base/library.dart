library;

import 'package:vocabulary/base.dart';

// * Theme data

// List<int> get primaryColor {
// var primaryColorString = Data.app.getMap(T.setting)["primaryColor"] as String;
// return primaryColorString
//   .split(',')
//   .map((s) => int.parse(s.trim()))
// .toList();
// }

Color _primaryColor = hexColor("#028C6A");
Color _secondaryColor = Color.fromRGBO(211, 194, 42, 1);
Color _errorColor = Colors.redAccent;
Color get primary => _primaryColor;
Color secondary() => _secondaryColor;
Color errorColor() => _errorColor;

Color light({int o = 0}) => Color.fromRGBO(232 - o, 232 - o, 232 - o, 1);

Color dark({int o = 0}) => Color.fromRGBO(24 + o, 24 + o, 24 + o, 1);

TextStyle textStyle({
  double size = 20,
  int os = 0,
  bool op = true,
  n = false,
}) => TextStyle(
  color: style(os: os, op: op, n: n),
  fontSize: size,
);

Text text(
  String text, {
  double size = 16,
  FontWeight w = FontWeight.normal,
  os = -12,
  ml = 1,
}) => Text(
  text,
  style: TextStyle(
    fontSize: size,
    color: style(os: os),
    fontWeight: w,
  ),
  maxLines: ml,
);

Icon icon(IconData icon, {double size = 20}) =>
    Icon(icon, size: size, color: style());

FittedBox getErrorBox(String text, {color = Colors.red}) => FittedBox(
  child: Container(
    color: color,
    child: Text(text, style: TextStyle(color: Colors.white)),
  ),
);
IconThemeData getIconThemeData(double size, [Color? color, op = true]) =>
    IconThemeData(size: size, color: color ?? style());

Color style({bool op = true, int os = -12, bool n = false}) {
  if (n) {
    return op
        ? (darkMode ? light(o: os) : hexColor("#151922", os: os))
        : (darkMode ? hexColor("#151922", os: os) : light(o: os));
  } else {
    return op
        ? (darkMode ? hexColor("#F2F8FB", os: os) : dark(o: os))
        : (darkMode ? dark(o: os) : hexColor("#F2F8FB", os: os));
  }
}

Color decideStyle(Color color) =>
    (color.r * 255 + color.g * 255 + color.b * 255 > 142 * 3)
    ? dark()
    : light();

Color primaryStyle() =>
    _primaryColor.r + _primaryColor.g + _primaryColor.b > 0.45 * 3
    ? dark()
    : light();

Container divider({
  double height = 0.5,
  double w = 20,
  double v = 5,
  // EdgeInsets edge = const EdgeInsets.fromLTRB(w, 0, w, 0),
  EdgeInsets mar = const EdgeInsets.symmetric(horizontal: 2.5),
}) => Container(
  margin: mar,
  child: Container(
    height: height.toDouble(),
    color: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: w, vertical: v),
  ),
);

@Deprecated("use another feature instead")
void setPrimaryColor(Color color) {
  // _primaryColor = color;
  // var t = Data.app.getMap(T.setting);
  // t["primaryColor"] =
  //     "${color.alpha},${color.red},${color.green},${color.blue}";
  // Data.app.storeMap(T.setting, t);
}

void setSecondaryColor(Color color) => _secondaryColor = color;
void setErrorColor(Color color) => _errorColor = color;

Color hexColor(String hex, {int os = 0}) {
  hex = hex.replaceAll('#', '');
  if (hex.length == 6) {
    hex = 'FF$hex';
  }
  if (hex.length == 8) {
    Color baseColor = Color(int.parse('0x$hex'));
    return adjustColor(baseColor, os);
  }
  return Colors.transparent;
}

EdgeInsets edge({double h = 0, double v = 0}) {
  return EdgeInsets.symmetric(horizontal: h, vertical: v);
}

Color adjustColor(Color color, int os) {
  int r = ((color.r * 255.0).round() & 0xff + os).clamp(0, 255).toInt();
  int g = ((color.g * 255.0).round() & 0xff + os).clamp(0, 255).toInt();
  int b = ((color.b * 255.0).round() & 0xff + os).clamp(0, 255).toInt();
  return Color.fromARGB(color.alpha, r, g, b);
}

Color colorStyle(Color color, [int os = 12]) {
  return (color.r + color.g + color.b) > 0.5 * 3 ? dark(o: os) : light(o: os);
}

// ignore: unused_element
Color _getOppositeColor(String hex) {
  Color color = hexColor(hex);
  int r = 255 - color.red;
  int g = 255 - color.green;
  int b = 255 - color.blue;
  return Color.fromARGB(color.alpha, r, g, b);
}

String rgba32ToHex(int rgba) {
  int r = (rgba >> 24) & 0xFF;
  int g = (rgba >> 16) & 0xFF;
  int b = (rgba >> 8) & 0xFF;
  int a = rgba & 0xFF;

  return '#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}${a.toRadixString(16).padLeft(2, '0')}';
}

int hexToRgba32(String hex) {
  hex = hex.replaceFirst('#', '');

  int r = int.parse(hex.substring(0, 2), radix: 16);
  int g = int.parse(hex.substring(2, 4), radix: 16);
  int b = int.parse(hex.substring(4, 6), radix: 16);
  int a = int.parse(hex.substring(6, 8), radix: 16);

  return (r << 24) | (g << 16) | (b << 8) | a;
}

void e() {}

ListTile getListTile(
  IconData leading,
  String title, {
  leadingSize = 20.0,
  titleSize = 20.0,
  IconData trailing = Icons.abc,
  trailingSize = 20.0,
  Function trailingFunc = e,
}) {
  return ListTile(
    leading: Icon(leading, color: style(), size: leadingSize),
    title: Text(
      title,
      style: TextStyle(color: style(), fontSize: titleSize),
    ),
    trailing: (trailing == Icons.abc)
        ? Container()
        : IconButton(
            onPressed: () {
              trailingFunc();
            },
            icon: Icon(trailing, color: style(), size: trailingSize),
          ),
  );
}

// * Store Type

// class T {
//   static final String currentWindowIndex = "currentWindowIndex";
//   static final String setting = "setting";
//   static final String task = "task";
//   static final String calendarRepeat = "calendarRepeat";
// }

// * information

// class System {
//   static const bool darkMode = true;
//   static String version = ""; // Beta 1.1.2
//   static bool debugMode = true;
// }

class A {
  static ThemeData get themeData => ThemeData(
    primaryColor: primary,
    primaryColorLight: primary,
    primaryColorDark: primary,
    hoverColor: Color.fromRGBO(192, 192, 192, 1),
    splashColor: style(op: false),
    highlightColor: style(op: false),
    scaffoldBackgroundColor: style(op: false),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primary),
    hintColor: Color.fromRGBO(128, 128, 128, 1),
    appBarTheme: AppBarTheme(
      // shadowColor: primary,
      // foregroundColor: primary,
      surfaceTintColor: primary,
      actionsIconTheme: getIconThemeData(32),
      backgroundColor: style(n: true, op: false, os: -6),
      titleTextStyle: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: style(),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
      focusColor: style(os: 96),
      splashColor: style(os: 64),
      hoverColor: style(os: 48),
      shape: CircleBorder(),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: style(op: false, n: true, os: 6),
      selectedIconTheme: IconThemeData(color: primary),
      unselectedIconTheme: getIconThemeData(24),
      selectedItemColor: primary,
      unselectedItemColor: style(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 8),
      hintStyle: TextStyle(fontSize: 16, color: style(os: 48)),
      focusColor: Colors.deepPurpleAccent,
      hoverColor: Colors.blueAccent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(),
  );
}
