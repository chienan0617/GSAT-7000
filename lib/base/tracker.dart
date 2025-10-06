import 'package:vocabulary/base.dart';

class Tracker implements Initialable {
  static late final List<Database> datas;

  static final List<String> dataBaseName = [
    "989F30E3",
    "75C101CF",
    "C1DB19F8",
    "D3BC5260",
    // "33C6BF9C", // "94ABA4D1", // "1275A603", // "D47DAD14",
  ];

  @initial
  static Future<void> initialize() async {
    datas = [];

    for (final dataName in dataBaseName) {
      datas.add(Database(dataName));
    }
  }
}
