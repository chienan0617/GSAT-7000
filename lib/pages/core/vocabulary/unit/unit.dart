import 'package:vocabulary/base.dart';
import 'package:vocabulary/pages/core/vocabulary/unit/section.dart';
import 'package:vocabulary/script/data/textbook.dart';

class VocabularyUnitPage extends StatefulWidget {
  final Textbook textbook;

  const VocabularyUnitPage({super.key, required this.textbook});

  @override
  State<VocabularyUnitPage> createState() => _VocabularyUnitPageState();
}

class _VocabularyUnitPageState extends State<VocabularyUnitPage> {
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
        title: textNt("132132", 20, fw7),
        leading: iconButton(
          icon(Icons.arrow_back, 26),
          () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          height(10),
          UnitSelection(unit: widget.textbook.units[0]),
          UnitSelection(unit: widget.textbook.units[1]),
        ],
      ),
    );
  }
}
