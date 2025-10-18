import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/vocabulary/type.dart';
import 'package:vocabulary/script/data/vocabulary/vocabulary.dart';

mixin VocabularyUtils {
  static List<Color> familiarToColor = [
    hexColor('#FF6F61'),
    hexColor('#E0B75E'),
    hexColor('#449F7F'),
  ];

  static Color getRelativeColor(Vocabulary voc) {
    int fam = voc.cust.familiarity;
    if (fam > familiarToColor.length) throw IndexOutOfBoundError();
    return familiarToColor.elementAt(fam);
  }

  static String getTypeStringify(VocabularyType type) {
    return switch (type) {
      VocabularyType.noun => "(n)",
      _ => throw NoElementError(),
    };
  }

  static String getInserted(Vocabulary voc, VocabularyWordUsage sora) {
    get(VocabularyWordUsage v) => switch (v) {
      VocabularyWordUsage.synonyms => voc.usage.synonyms,
      VocabularyWordUsage.antonyms => voc.usage.antonyms,
      VocabularyWordUsage.related => voc.usage.extensions,
    };

    StringBuffer builder = StringBuffer();
    List<String> sou = get(sora) ?? [];
    // b.write(object)

    for (int i = 0; i < sou.length - 1; i++) {
      builder.write(sou[i]);
      builder.write(", ");
    }
    builder.write(sou.last);

    return builder.toString();
  }

  static String getUsageTranslated(VocabularyWordUsage usage) {
    return switch (usage) {
      VocabularyWordUsage.antonyms => "反意詞",
      VocabularyWordUsage.synonyms => "同意詞",
      VocabularyWordUsage.related => "關係詞",
    };
  }
}

enum VocabularyWordUsage { synonyms, antonyms, related }
