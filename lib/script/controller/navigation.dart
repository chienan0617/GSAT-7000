import 'package:vocabulary/base.dart';

class Navigation {
  @registerFirst
  static String keyName = 'navigation-bar-index';
  static int currentIndex = Data.app.get(keyName);
  static final Widget _defaultPage = box();

  static void onChange(int newValue) {
    Data.app.put(keyName, newValue);
    currentIndex = newValue;
    Rebuild.corePageRebuild();
  }

  static Widget getPage() {
    switch (currentIndex) {
      // case 0: return DashboardPage();
      case 0: return _defaultPage;
      case 1: return _defaultPage;
      case 2: return _defaultPage;
      // case 2: return _defaultPage;
      case 3: return _defaultPage;
      default: return _defaultPage;
    }

    // return CalendarPage();
  }
}
