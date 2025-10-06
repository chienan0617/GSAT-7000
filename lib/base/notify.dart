import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:vocabulary/base.dart';

class Notify implements Initialable {
  static final plugin = FlutterLocalNotificationsPlugin();

  @initial
  static Future<void> initialize() async {
    @functional
    Future<void> initTimeZone() async {
      tz.initializeTimeZones();
      final String tzName = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(tzName));
    }

    @functional
    Future<void> initPlugin() async {
      await plugin.initialize(
        InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(),
        ),
      );
    }

    @functional
    Future<void> requestNotificationPermission() async {
      if (await Permission.notification.request().isGranted) {
        // debugPrint('通知權限已授予');
      } else {
        // debugPrint('通知權限被拒或永久拒絕');
      }
    }

    if (!kIsWeb) {
      if (!(Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
        await initTimeZone();
        await initPlugin();
        await requestNotificationPermission();
      }
    }
  }

  @method
  static Future<void> schedule({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    final tzScheduled = tz.TZDateTime.from(scheduledTime, tz.local);

    await plugin.zonedSchedule(
      id,
      title,
      body,
      tzScheduled,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'default_channel',
          'Default Channel',
          channelDescription: '用於排程通知',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: null,
      payload: null,
    );
  }

  @test
  static Future<void> testing() async {
    await Notify.schedule(
      id: 113133123,
      title: '嗨',
      body: '早安你好',
      scheduledTime: DateTime.now().add(const Duration(seconds: 5)),
    );
  }
}
