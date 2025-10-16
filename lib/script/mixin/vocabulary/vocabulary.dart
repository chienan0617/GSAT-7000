
import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/data/vocabulary/vocabulary.dart';

mixin VocabularyUtils {
  static List<Color> familiarToColor = [
    hexColor('#FF6F61'), hexColor('#E0B75E'), hexColor('#449F7F'),
  ];

  static Color getRelativeColor(Vocabulary voc) {
    int fam = voc.cust.familiarity;
    if (fam > familiarToColor.length) throw IndexOutOfBoundError();
    return familiarToColor.elementAt(fam);
  }
}
