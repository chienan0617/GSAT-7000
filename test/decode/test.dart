import 'package:vocabulary/base/debug.dart';
import 'package:vocabulary/script/mixin/textbook/textbook_decoder.dart';

void main() {
  String sou =
      "Unit 21&c,n,apple,type of food,蘋果/餅購,apple/synonyms,apple/antonyms,apple/extensions,an + apple,I am eating an apple/Apple everyday, doctor keeps away.;\$c,n,banana,type of food too,香蕉/金糾,bananas/synonyms,bananas/antonyms,bananas/extensions,a + banana,I am eating an banana/Banana everyday, doctor keeps away.&2023-10-26 10:30:00.000&normal";

  var result = TextbookDecoder.decodeTextbookFromDecodedString(sou);
  Debug.log(result.units.map((e) => e.voc.map((e) => e.info.word)));
}
