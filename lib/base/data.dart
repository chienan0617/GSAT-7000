import 'package:vocabulary/base.dart';
import 'package:crypto/crypto.dart' as crypto;


class Data {
  static final String databaseVersion = System.databaseVersion;
  static final app = Database('app');
  // static final taskGroup = Database('task-group');
  // static final taskDeleted = Database('task-deleted');

  static final List<Registerable> _dataList = [app];

  static String getDatabaseName(String boxName) {
    return Database.transferKey('$databaseVersion@${boxName.hashCode}');
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
  late final Box _box;

  Database(this.boxName);

  static String transferKey(String key) {
    final String salt = Data.databaseVersion;
    final bytes = utf8.encode(salt + key);
    final digest = crypto.sha256.convert(bytes);
    return digest.toString().substring(0, 16);
  }

  @override
  Future<void> initialize() async {
    // try {
    String name = Data.getDatabaseName(boxName);
    _box = await Hive.openBox(name);
    // } catch (error) {
    //   log(error.toString());
    // }

    final data = await FileHandle.getRegister(boxName.split('@').last);

    // This loop correctly iterates over each key-value pair in the map.
    for (final entry in data.entries) {
      final key = transferKey(entry.key);
      final value = entry.value;

      if (!_box.containsKey(key)) {
        _box.put(key, value);
      }
    }
  }

  bool checkKeyExist(String key, dynamic defaultValue) {
    if (!_box.containsKey(key)) {
      // * transform key before
      put(key, defaultValue);

      return false;
    }
    return true;
  }

  void put<E>(String key, value) => _box.put(transferKey(key), value);
  E get<E>(String key) => _box.get(transferKey(key)) as E;
  void delete<E>(String key) => _box.delete(transferKey(key));
  Iterable<E> values<E>() => _box.values.cast<E>();
  Iterable<E> whereType<E>() => _box.values.whereType<E>();

  Box getBox() => _box;
}
