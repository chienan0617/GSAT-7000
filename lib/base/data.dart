import 'package:vocabulary/base.dart';

class Data {
  static final String databaseVersion = System.databaseVersion;
  static final app = Database('app');
  static final taskGroup = Database('task-group');
  static final taskDeleted = Database('task-deleted');

  static final List<Registerable> _dataList = [app, taskGroup, taskDeleted];

  static String getDatabaseName(String boxName) {
    return '$databaseVersion@${boxName.hashCode}'.hashCode.toString();
  }

  static Future<void> initialize() async {
    // log(getApplicationDocumentsDirectory().toString());
    // await Hive.initFlutter(getApplicationDocumentsDirectory().toString());
    registerAdapter();

    for (var data in _dataList) {
      await data.initialize();
    }
  }

  static void registerAdapter() {
    // Hive.ignoreTypeId(97);
    Hive.registerAdapter(ColorAdapter());
    // Hive.registerAdapter(adapter)
  }
}

abstract class Registerable {
  Future<void> initialize();
}

class Database implements Registerable, Initialable {
  final String boxName;
  late final Box box;

  Database(this.boxName);

  @override
  Future<void> initialize() async {
    // try {
    String name = Data.getDatabaseName(boxName);
    box = await Hive.openBox(name);
    // } catch (error) {
    //   log(error.toString());
    // }

    final data = await FileHandle.getRegister(boxName.split('@').last);

    // This loop correctly iterates over each key-value pair in the map.
    for (final entry in data.entries) {
      final key = entry.key;
      final value = entry.value;

      // The commented-out code suggests you wanted to add
      // new entries to a 'box' if they didn't already exist.
      if (!box.containsKey(key)) {
        box.put(key, value);
      }

      // Then, you can call your function with the correct key and value.
      checkKeyExist(key, value);
    }
  }

  bool checkKeyExist(String key, dynamic defaultValue) {
    if (!box.containsKey(key)) {
      box.put(key, defaultValue);

      return false;
    }
    return true;
  }

  void put<E>(String key, dynamic value) => box.put(key, value);
  E get<E>(String key) => box.get(key) as E;
  void delete<E>(String key) => box.delete(key);
}
