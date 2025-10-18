import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/vocabulary/vocabulary.dart';
import 'package:vocabulary/script/mixin/vocabulary/vocabulary.dart';

class VocabularyDetailInfo extends StatefulWidget {
  final int unitNum;
  final String textbookName;
  final Vocabulary voc;

  const VocabularyDetailInfo({
    super.key,
    required this.unitNum,
    required this.textbookName,
    required this.voc,
  });

  @override
  State<VocabularyDetailInfo> createState() => _VocabularyDetailInfoState();
}

class _VocabularyDetailInfoState extends State<VocabularyDetailInfo> {
  late String use = VocabularyUtils.getTypeStringify(widget.voc.info.type);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        height(15),
        info(),
        height(10),
        vocBar(),
        height(5),
        vocBarFor(),
        height(10),
        divider(),
        explanation(),
        height(10),
        examples(),
        relatedWord(),
        // usage(),
      ],
    );
  }

  Widget vocBar() => Row(
    crossAxisAlignment: crossCenter,
    children: [
      width(20),
      textNt(widget.voc.info.word, 36, fw7),
      expand(),
      iconButton(icon(Icons.arrow_back_ios, 26, textColor2)),
      iconButton(icon(Icons.arrow_forward_ios, 26, textColor2)),
      width(5),
    ],
  );

  Widget vocBarFor() => Column(
    children: [
      Row(
        children: [
          width(20),
          textNt(use, 22, fw6, textColor2),
          width(10),
          textNt(widget.voc.info.meanings[0], 22, fw6, textColor2),
        ],
      ),
    ],
  );

  Widget info() => Row(
    children: [
      width(20),
      textNt(widget.textbookName, 18, fw6, textColor2),
      textNt(", Unit ${widget.unitNum}", 18, fw6, textColor2),
      expand(),
      textD("熟悉度", 18, fw6, textColor2),
      width(10),
      center(
        GestureDetector(
          onTap: none,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: VocabularyUtils.getRelativeColor(widget.voc),
            ),
          ),
        ),
      ),
      width(20),
    ],
  );

  Widget usage() => Padding(
    padding: symmetricH(20),
    child: Column(
      children: [
        height(10),
        textD("用法", 18, fw6),

        // height(20),
        // height(10),
        // height(10),
      ],
    ),
  );

  Widget dot() => Row(
    children: [
      width(7.5),
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryColor.withAlpha(128),
        ),
      ),
      width(17.5),
    ],
  );

  Widget examples() => Padding(
    padding: symmetricH(20),
    child: Column(
      crossAxisAlignment: crossStart,
      children: [
        textD("例句", 18, fw6),
        height(10),
        ...List.generate(
          widget.voc.usage.examples.length,
          (index) => Row(
            // crossAxisAlignment: cr,
            children: [
              dot(),
              SizedBox(
                width: size(context).width * 0.775,
                child: Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    textNt(widget.voc.usage.examples[index], 18, fw6),
                    textNt(
                      widget.voc.usage.exaTran[0][index],
                      18,
                      fw6,
                      textColor2,
                    ),
                    height(15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget explanation() => Padding(
    padding: symmetricH(20),
    child: Column(
      crossAxisAlignment: crossStart,
      children: [
        height(5),
        textD("解釋", 20, fw6),
        height(5),
        Row(
          children: [
            width(20),
            textNt(widget.voc.info.explanation ?? "", 18, fw5),
          ],
        ),
        height(2.5),
      ],
    ),
  );

  Widget sora(VocabularyWordUsage sora) => Row(
    crossAxisAlignment: crossStart,
    children: [
      width(40),
      textD(VocabularyUtils.getUsageTranslated(sora), 18, fw6, textColor2),
      width(7.5),
      textNt(VocabularyUtils.getInserted(widget.voc, sora), 18, fw6),
    ],
  );

  Widget relatedWord() => Column(
    children: [
      Row(children: [width(20), textD("相關詞", 18, fw6)]),
      height(10),
      sora(VocabularyWordUsage.synonyms),
      height(5),
      sora(VocabularyWordUsage.antonyms),
      height(5),
      sora(VocabularyWordUsage.related),
    ],
  );
}
