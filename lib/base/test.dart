import 'package:vocabulary/base.dart';
import 'package:vocabulary/script/mixin/textbook/textbook_decoder.dart';

@test
enum System { out }

e() {}

String sou =
    "7000單字Level 4&c\\n\\apple\\type of food\\蘋果/餅購\\apple/synonyms\\apple/antonyms\\apple/extensions\\an + apple\\I am eating an apple/Apple everyday, doctor keeps away.\\我在吃蘋果%每天一蘋果，醫生遠離我/窩家假餅購%金糾every day, 森聲妓買未\$c\\n\\banana\\type of food too\\香蕉/金糾\\bananas/synonyms\\bananas/antonyms\\bananas/extensions\\a + banana\\I am eating an banana/Banana everyday, doctor keeps away.\\我在吃香蕉%每天一香蕉，醫生遠離我/窩家假金鳩%金糾every day, 森聲妓買未&2023-10-26 10:30:00.000";

var result = TextbookDecoder.decodeTextbookFromDecodedString(sou);
