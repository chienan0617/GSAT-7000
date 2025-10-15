import 'package:flutter/material.dart';

class Util {
  static String getCurrentFormat() {
    var now = DateTime.now();

    return getDateFormat(now.year, now.month, now.day);
  }

  static String getDateFormat(int year, int month, int day) {
    return '<$year-$month-$day>';
  }

  static Color colorPrimary(Color color) {
    return (color.r + color.g + color.b) > 0.5 * 3
        ? Colors.black
        : Colors.white;
  }

  static void showSnackBar(ctx, sb) {
    ScaffoldMessenger.of(ctx).showSnackBar(sb);
  }

  static void cancelSnackBar(ctx) {
    ScaffoldMessenger.of(ctx).clearSnackBars();
  }

  static void openDrawer(ctx) {
    Scaffold.of(ctx).openDrawer();
  }

  // static DateTime getFormatDate(int year, int month, int day) {
  //   var date = CalendarUtil.getFormatTime(year, month, day);
  //   return DateTime(date.$1, date.$2, date.$3);
  // }

  static List<DateTime> getDaysInBetween(DateTime start, DateTime end) {
    final totalDays = end.difference(start).inDays + 1;
    return List.generate(totalDays, (i) => start.add(Duration(days: i)));
  }

  static List<DateTime> getDaysInRange(DateTime start, DateTime end) {
    final days = <DateTime>[];
    for (
      var dt = DateTime(start.year, start.month, start.day);
      !dt.isAfter(end);
      dt = dt.add(Duration(days: 1))
    ) {
      days.add(dt);
    }
    return days;
  }
}

String str(Object object) => object.toString();

Widget height(double h) => SizedBox(height: h);
Widget width(double h) => SizedBox(width: h);
// String str(Object object) => object.toString();
