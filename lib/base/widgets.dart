import 'package:vocabulary/base.dart';

width([v = 0.0]) => SizedBox(width: v.toDouble());
height([v = 0.0]) => SizedBox(height: v.toDouble());
box([w = 0.0, h = 0.0]) => SizedBox(width: w.toDouble(), height: h.toDouble());
boxV(v) => SizedBox(child: v);

Size size(ctx) => MediaQuery.of(ctx).size;

Text text(
  String msg, [
  double size = 16,
  FontWeight weight = fw5,
  Color color = textColor,
  bool translate = true,
  FontStyle style = fsN,
]) => Text(
  translate ? word(msg) : msg,
  style: TextStyle(
    fontSize: size,
    fontWeight: weight,
    fontStyle: fsN,
    color: color,
  ),
);

Text textNt(
  String msg, [
  double size = 16,
  FontWeight weight = fw5,
  Color color = textColor,
  FontStyle style = fsN,
]) => text(msg, size, weight, color, false, style);

Text textD(
  String msg, [
  double size = 16,
  FontWeight weight = fw5,
  Color color = textColor,
  FontStyle style = fsN,
]) => System.debugMode
    ? textNt(msg, size, weight, color, style)
    : throw DebugError();

borderCircular(double v) => BorderRadius.circular(v);
symmetricH(double v) => EdgeInsets.symmetric(horizontal: v);
symmetricV(double v) => EdgeInsets.symmetric(vertical: v);
symmetric(double h, double v) =>
    EdgeInsets.symmetric(horizontal: h, vertical: v);

center(Widget v) => Center(child: v);

expand() => Expanded(child: box());
expandV(v) => Expanded(child: v);

Icon icon(IconData icon, [double size = 20, Color color = textColor]) =>
    Icon(icon, size: size, color: color);

IconButton iconButton(Icon icon, [VoidCallback fn = none]) =>
    IconButton(onPressed: fn, icon: icon);

@Deprecated("some problem needed to be fix")
pushScene(scene, ctx) =>
    Navigator.push(ctx, MaterialPageRoute(builder: (_) => scene));

popPage(ctx) => Navigator.pop(ctx);
