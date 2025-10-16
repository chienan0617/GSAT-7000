import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/vocabulary/vocabulary.dart';
import 'package:vocabulary/script/mixin/vocabulary/vocabulary.dart';

class InventorySection extends StatelessWidget {
  final Vocabulary voc;

  const InventorySection({super.key, required this.voc});

  @override
  Widget build(BuildContext ctx) {
    return center(
      Container(
        width: size(ctx).width * 0.9,
        height: size(ctx).height * 0.0685,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: textColor2)),
        ),
        child: center(Row(
          children: [
            width(15),
            textD(voc.info.word, 20, fw7),
            expand(),
            Container(
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: VocabularyUtils.getRelativeColor(voc)
              ),
            ),
            width(20)
          ],
        )),
      ),
    );
  }
}
