import 'package:vocabulary/base.dart';

class Internet implements Initialable {
  static final service = 'https://service.cas617.workers.dev/calendar-noter';

  @initial
  static Future<void> initialize() async {

  }

  @functional
  static Future<T> fetch<T>(String url, [Map? params]) async {
    var req = '?';
    if (params != null) params.forEach((k, v) => req += '$k=$v');
    final res = await get(Uri.parse(params == null ? url : url+ req));

    if (res.statusCode != 200) {
      throw Exception('fetch failed: ${res.statusCode}');
    }

    return res.body as T;
  }

  static Future<String> newUser() async {
    return await fetch<String>('$service/newUser', {
      'time': DateTime.now().toString()
    });
  }
}
