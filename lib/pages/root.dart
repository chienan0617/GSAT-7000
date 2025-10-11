import 'package:vocabulary/base.dart';
import 'package:vocabulary/pages/core/core.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    super.initState();
    // darkMode = Data.app.get<String>('setting:theme') == 'light' ? false : true;
    Rebuild.rootRebuild = () => setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: darkMode ? Brightness.dark : Brightness.light,
        primaryColor: primaryColor,
        // scaffoldBackgroundColor: darkMode ? background1 : background2,
        // canvasColor: darkMode ? background3 : background4,
        // textTheme: TextTheme(
        //   // bodyText1: TextStyle(color: textColor),
        //   // bodyText2: TextStyle(color: textColor2),
        // ),
      ),
      home: const CorePage(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }
}
