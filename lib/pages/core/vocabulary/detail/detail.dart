import 'package:vocabulary/base.dart';
import 'package:vocabulary/pages/core/vocabulary/detail/information.dart';
import 'package:vocabulary/script/data/vocabulary/vocabulary.dart';

class VocabularyDetailPage extends StatefulWidget {
  final int unitNum;
  final String textbookName;
  final Vocabulary voc;

  const VocabularyDetailPage({
    super.key,
    required this.voc,
    required this.unitNum,
    required this.textbookName,
  });

  @override
  State<VocabularyDetailPage> createState() => _VocabularyDetailPageState();
}

class _VocabularyDetailPageState extends State<VocabularyDetailPage> {
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
        title: textNt("Detailed", 20, fw7),
        leading: iconButton(
          icon(Icons.arrow_back, 26),
          () => Navigator.pop(context),
        ),
        actions: [
          iconButton(icon(Icons.menu, 26)),
          width(5),
        ],
      ),
      body: VocabularyDetailInfo(
        unitNum: widget.unitNum,
        textbookName: widget.textbookName,
        voc: widget.voc,
      )
    );
  }
}
