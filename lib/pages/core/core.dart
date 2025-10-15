import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/controller/navigation.dart';

class CorePage extends StatefulWidget {
  const CorePage({super.key});

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
  @override
  void initState() {
    super.initState();
    Rebuild.corePageRebuild = () => setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigation.getPage(),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: [
            item(Icons.book_outlined, Icons.book, "Vocabulary", 0),
            item(Icons.search, Icons.saved_search, "Vocabulary", 1),
            // item(Icons.contact, Icons.saved_search, "Vocabulary", 1),
            item(Icons.settings_outlined, Icons.settings, "Setting", 2),
          ],
          backgroundColor: c2,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          selectedItemColor: primaryColor,
          unselectedItemColor: textColor,
          selectedLabelStyle: TextStyle(
            color: textColor,
            fontFamily: textFamily,
          ),
          // unselectedLabelStyle: const TextStyle(color: Colors.amber, fontFamily: textFamily),
          onTap: Navigation.onChange,
          currentIndex: Navigation.currentIndex,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  BottomNavigationBarItem item(
    IconData icon,
    IconData iconSelected,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(
        Navigation.currentIndex == index ? iconSelected : icon,
        size: 28,
      ),
      label: Language.word(label),
    );
  }
}
