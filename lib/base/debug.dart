import 'dart:developer' as dev;

class Debug {
  static void log(Object object) {
    dev.log('[${DateTime.now().toString().substring(9, 15)}] ${object.toString()}');
  }
}
