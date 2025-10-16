import 'package:vocabulary/base.dart';
import 'package:vocabulary/pages/core/vocabulary/inventory/inventory.dart';
import 'package:vocabulary/script/data/unit.dart';

class UnitSelection extends StatelessWidget {
  final Unit unit;

  const UnitSelection({super.key, required this.unit});

  @override
  Widget build(BuildContext ctx) {
    return center(
      GestureDetector(
        onTap: () => Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (_) => VocabularyInventoryPage(unit: unit),
          ),
        ),
        child: Container(
          margin: symmetricV(7.5),
          width: size(ctx).width * 0.9,
          height: size(ctx).height * 0.08685,
          decoration: BoxDecoration(
            color: c3,
            borderRadius: borderCircular(10),
          ),
          child: Row(
            children: [
              width(15),
              expandV(
                Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    height(10),
                    textD("Unit ${Math.nextInt(100)}", 18, fw7),
                    expand(),
                    textD("61% completed", 14, fw5, textColor2),
                    height(2.5),
                    LinearProgressIndicator(
                      value: 0.61,
                      minHeight: 4,
                      backgroundColor: c2,
                      color: debugColor2,
                      borderRadius: borderCircular(10),
                    ),
                    height(10),
                  ],
                ),
              ),
              iconButton(icon(Icons.arrow_forward_ios)),
            ],
          ),
        ),
      ),
    );
  }
}
