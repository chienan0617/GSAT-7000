import 'package:vocabulary/base.dart';
import 'package:vocabulary/pages/core/vocabulary/inventory/section.dart';
import 'package:vocabulary/script/data/unit.dart';

class VocabularyInventoryPage extends StatefulWidget {
  final Unit unit;
  final String textbookName;

  const VocabularyInventoryPage({
    super.key,
    required this.unit,
    required this.textbookName,
  });

  @override
  State<VocabularyInventoryPage> createState() =>
      _VocabularyInventoryPageState();
}

class _VocabularyInventoryPageState extends State<VocabularyInventoryPage> {
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
        title: textNt("E", 20, fw7),
        leading: iconButton(
          icon(Icons.arrow_back, 26),
          () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          height(10),
          InventorySection(
            voc: widget.unit.voc.first,
            textbookName: widget.textbookName,
            unitNum: widget.unit.num,
          ),
          InventorySection(
            voc: widget.unit.voc.last,
            textbookName: widget.textbookName,
            unitNum: widget.unit.num,
          ),
        ],
      ),
    );
  }
}
