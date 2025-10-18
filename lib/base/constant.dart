library;

import 'package:archive/archive.dart' hide FileHandle;
import 'package:vocabulary/base.dart';

// var darkMode = Data.app.get<String>('setting:theme') == 'light' ? false : true;   //Random().nextBool();
const bool darkMode = false;
const primaryColor = Color(0xFF235BEF);
var primaryStyle = Util.colorPrimary(primaryColor);

const debugColor = Colors.amber;
final debugColor2 = hexColor("#028C6A");
const textFamily = 'Space Grotesk';

const Color textColor = darkMode ? Colors.white : Colors.black;
const Color textColor2 = darkMode ? Colors.white70 : Colors.black54;
const Color textColorP = !darkMode ? Colors.white : Colors.black;
const Color textColorP2 = !darkMode ? Colors.white70 : Colors.black87;
const Color background1 = darkMode
    ? Color.fromARGB(255, 18, 21, 27)
    : Color(0xFFF7F9FC);
var background2 = darkMode ? const Color(0xFF91A0C9) : const Color(0xFF49609B);
var background3 = darkMode ? Color.fromARGB(255, 15, 18, 24) : Colors.white;
var background4 = darkMode ? const Color(0xFF262626) : const Color(0xFFE8EAF2);

var c1 = _pair(hex(0x111418), hex(0xF8F9FA));
var c2 = _pair(hex(0x121E23), hex(0xFFFFFF));
var c3 = _pair(hex(0x1F2937), hex(0xEEF1F4));

final gZipDecoder = GZipDecoder();

const transparent = Colors.transparent;
final void Function() onPressed = none;
void none() {}

Color _pair(Color d, Color l) => darkMode ? d : l;

const fw1 = FontWeight.w100;
const fw2 = FontWeight.w200;
const fw3 = FontWeight.w300;
const fw4 = FontWeight.w400;
const fw5 = FontWeight.w500;
const fw6 = FontWeight.w600;
const fw7 = FontWeight.w700;
const fw8 = FontWeight.w800;
const fw9 = FontWeight.w900;

const crossStart = CrossAxisAlignment.start;
const crossCenter = CrossAxisAlignment.center;
const mainStart = MainAxisAlignment.start;
const mainMin = MainAxisSize.min;

const fsN = FontStyle.normal;
const fsI = FontStyle.italic;

// ignore: camel_case_types
typedef string = String;

List<Color> colors =
    (FileHandle.getAndSaveCache("colors", "colors") as Iterable)
        .cast<String>()
        .map((e) => hexColor(e))
        .toList()
        .cast<Color>();

// ignore: unused_element
List<Color> _colors = [
  hexColor('#F3EAC6'), // 曙光米 Daybreak
  hexColor('#F6F1D3'), // 淡奶油 Pale Cream
  hexColor('#DFDAD8'), // 被動灰 Passive
  hexColor('#FFF2EF'), // 柔和桃 Soft Peach
  hexColor('#FAD6D6'), // 嬰兒粉 Baby Pink
  hexColor('#FFE2CC'), // 杏仁色 Apricot
  hexColor('#FFDAC1'), // 淺杏橘 Light Apricot
  hexColor('#FCE1E4'), // 粉香檳 Pink Champagne
  hexColor('#F6CED8'), // 玫瑰石 Rose Quartz
  hexColor('#F1C6D4'), // 腮紅粉 Blush Pink
  hexColor('#E6C0B3'), // 粉黏土 Blush Clay
  hexColor('#D8BCC5'), // 粉石英 Carnelian
  hexColor('#D2B1A3'), // 溫暖褐 Warm Taupe
  hexColor('#C5B0A0'), // 曬樹褐 Tanbark
  hexColor('#B6A29A'), // 石灰輝 Stone Gray
  hexColor('#DECBAA'), // 杏仁牛奶 Almond Milk
  hexColor('#D3B88C'), // 砂岩 Sandstone
  hexColor('#E0B75E'), // 晨光金 Sundew
  hexColor('#D9A24E'), // 稻草黃 Straw Harvest
  hexColor('#A16B47'), // 古銅棕 Burnt Sienna
  hexColor('#B17B5C'), // 粘土棕 Clay Brown
  hexColor('#8F5A3C'), // 摩卡 Mocha
  hexColor('#6C3E2A'), // 咖啡豆 Coffee Bean
  hexColor('#554C4A'), // 深棕褐 Dark Auburn
  hexColor('#A82E33'), // 熱情紅 Heartthrob
  hexColor('#FF6F61'), // 柔珊瑚 Muted Coral
  hexColor('#A9B8D3'), // 天際藍 Skyline
  hexColor('#C1E5F2'), // 法國海岸 French Coast
  hexColor('#B0D0D3'), // 粉藍 Powder Blue
  hexColor('#A1C6C8'), // 海風藍 Ocean Breeze
  hexColor('#B2DFE4'), // 湖水藍 Aqua Tone
  hexColor('#A2D8D0'), // 海泡綠 Seafoam
  hexColor('#ACCFCB'), // 微風綠 Breeze Green
  hexColor('#CDEDEA'), // 冰薄荷 Ice Mint
  hexColor('#AED9E0'), // 薄霧藍 Mist Blue
  hexColor('#93A8AC'), // 灰藍 Dusty Blue
  hexColor('#3D4D5C'), // 工業藍 Industrial Blue
  hexColor('#5B6C7D'), // 灰藍灰 Dust Blue
  hexColor('#3A5A8A'), // 升藍 Upward
  hexColor('#1E90FF'), // 道奇藍 Dodger Blue
  hexColor('#00BFFF'), // 深天藍 Deep Sky Blue
  hexColor('#D6D6D6'), // 淺水泥 Light Cement
  hexColor('#C0C0C0'), // 銀霧 Silver Mist
  hexColor('#A0A0A0'), // 陶土灰 Studio Clay
  hexColor('#A8A8A8'), // 晨霧灰 Foggy Morning
  hexColor('#B4B8B1'), // 鼠尾草綠 Sage Green
  hexColor('#A3B1A8'), // 苔蘚灰 Moss Gray
  hexColor('#7E9485'), // 橄欖綠 Olive Green
  hexColor('#597B71'), // 深苔綠 Deep Moss
  hexColor('#449F7F'), // 森林綠 Forest Green
  hexColor('#66CDAA'), // 中水綠 Aquamarine
  hexColor('#83C8B0'), // 水波綠 Watery
  hexColor('#A8D5BA'), // 霜葉綠 Frosted Leaf
  hexColor('#D1E2B8'), // 晨霧綠 Dawn Mist
  hexColor('#D4E8B3'), // 芹菜綠 Celery
  hexColor('#BCCCE0'), // 淡薰衣草 Mist Lavender
  hexColor('#EADCF6'), // 淡紫 Lilac Light
  hexColor('#C9C2E1'), // 淺薰衣草 Lite Lavender
  hexColor('#BFA2CC'), // 欣悅紫 Euphoric Lilac
  hexColor('#D8B7DD'), // 迷霧紫 Lilac Haze
  hexColor('#6A4C8C'), // 深梅紫 Deep Plum
  hexColor('#8C8E9F'), // 暮色藍 Twilight Blue
  hexColor('#4B3F3F'), // 木炭 Charcoal
];

//hexColor('#6495ED') Cornflower Blue

// 中藍系：hexColor('#4682B4') Steel Blue

// 深藍系：hexColor('#00008B') Dark Blue
