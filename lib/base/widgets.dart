import 'package:vocabulary/base.dart';

width([v = 0.0]) => SizedBox(width: v.toDouble());
height([v = 0.0]) => SizedBox(height: v.toDouble());
box([w = 0.0, h = 0.0]) => SizedBox(width: w, height: h);

Size size(ctx) => MediaQuery.of(ctx).size;
