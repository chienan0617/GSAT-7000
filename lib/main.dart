import 'base.dart';
import 'package:vocabulary/pages/root.dart';

void main() async {
  await Initialize.setupApp();
  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({super.key});
  @override State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override Widget build(BuildContext context) => const RootPage();
}
