import 'package:vocabulary/base.dart';
import 'package:vocabulary/pages/core/vocabulary/unit/unit.dart';
import 'package:vocabulary/script/data/textbook.dart';

class VocabularyTextbookSection extends StatelessWidget {
  final Textbook textbook;

  const VocabularyTextbookSection({super.key, required this.textbook});
  @override
  Widget build(BuildContext ctx) {
    return center(
      GestureDetector(
        onTap: () => Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (_) => VocabularyUnitPage(textbook: textbook),
          ),
        ),
        child: Container(
          margin: symmetricV(10),
          width: size(ctx).width * 0.9,
          height: size(ctx).height * 0.12875,
          decoration: BoxDecoration(
            borderRadius: borderCircular(15),
            color: c3,
          ),
          child: Row(
            crossAxisAlignment: crossStart,
            children: [
              width(20),
              expandV(
                Column(
                  crossAxisAlignment: crossStart,
                  mainAxisSize: mainMin,
                  children: [
                    height(10),
                    textNt(textbook.name, 20, fw7),
                    expand(),
                    textD("完成度 27%", 14, fw5, textColor2),
                    height(2.5),
                    LinearProgressIndicator(
                      value: 0.27,
                      minHeight: 5,
                      backgroundColor: c2,
                      color: debugColor2,
                      borderRadius: borderCircular(10),
                    ),
                    height(15),
                  ],
                ),
              ),
              center(icon(Icons.arrow_forward_ios, 24)),
              width(15),
            ],
          ),
        ),
      ),
    );
  }
}
