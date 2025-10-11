import 'package:vocabulary/base.dart';

class VocabularyPage extends StatefulWidget {
  const VocabularyPage({super.key});

  @override
  State<VocabularyPage> createState() => _VocabularyPageState();
}

class _VocabularyPageState extends State<VocabularyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background3,
      appBar: AppBar(
        backgroundColor: background1,
        centerTitle: true,
        shadowColor: textColor,
        elevation: 0.25,
        scrolledUnderElevation: 1,
        surfaceTintColor: Colors.transparent,
        title: text("Vocabulary", 20, fw7),
        leading: iconButton(icon(Icons.menu, 26)),
        actions: [
          iconButton(icon(Icons.settings_outlined, 26))
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
