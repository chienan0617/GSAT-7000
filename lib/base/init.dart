import 'package:vocabulary/base.dart';

class Initialize {
  @initial
  static Future<void> setupApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Constant.initialize();
    await Hive.initFlutter();
    await System.initialize();
    await Data.initialize();
    await Native.initialize();
    await Tracker.initialize();
    // await FlutterNativeTimezone.initialize();
    await Internet.initialize();
    await Language.initialize();
    await Notify.initialize();
    await Tutorial.initialize();
    // await AddTaskGroup.initialize();
    // await Calendar.initialize();
    // compute(callback, message)
    await test();
  }

  @temporary
  @Test()
  static Future<void> test() async {
    // Data.taskGroup.box.clear();
    // if (Data.taskGroup.box.values.isNotEmpty)
    // Hive.deleteFromDisk();
    // var defaultGroup = await TaskGroupUtil.ensureDefaultGroup();
    // if (defaultGroup.tasks.isEmpty) {
      // TaskGroupUtil.addTaskToGroup(
      //   'default',
      //   Task.create(
      //     title: 'task : demo ${Random().nextInt(32767).toString().padLeft(5, '0')}',
      //     subtitle: '--',
      //     taskGroupName: 'default',
      //     date: DateTime.now(),
      //     dayIndex: 0,
      //     expandRight: false,
      //     expandLeft: false,
      //     notifyTime: DateTime.now(),
      //     isMultiDays: false,
      //     sortIndex: 1,
      //     multiDaysCount: 0
      //   ),
      // );
    // }
    // Data.taskGroup.checkKeyExist(
    //   '<default>',
    //   TaskGroup.create('default', Colors.teal),
    // );

    // Data.app.put('language', 1);

    // if (Data.taskGroup.box.values.whereType<TaskGroup>().length == 1) {
    // TaskGroup.create('testing', debugColor);
    // TaskGroup.storeTaskGroup(TaskGroup.create('default', Colors.teal));
    // await Future.delayed(Duration(seconds: 1));
    // TaskGroup.addTaskToGroup(
    //   'default',
    //   Task.create(
    //     'task : ${Random().nextInt(32767).toString().padLeft(5, '0')}',
    //     'subtitle',
    //     'default',
    //     DateTime.now(),
    //   ),
    // );
    // }
    // if (Data.taskGroup.box.values.whereType<TaskGroup>().isEmpty) TaskGroup.create('testing', debugColor);

    // Notify.testing();
  }
}


class Initialable {}
