import 'package:flutter/cupertino.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/ExpandText/expand_text.dart';
import 'package:foodapp/widgets/iconstar/Icon_star.dart';
import 'package:foodapp/widgets/pos_icon/pos_icon_text.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class InforDetail extends StatelessWidget {
  const InforDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextDarkMode(text: "Margherita Pizza"),
                SizedBox(
                  height: Dimensions.height10,
                ),
                const PosIconText(pos: "Dong Da, Ha Noi"),
              ],
            ),
            Column(
              children: [
                TextDarkMode(
                  text: "\$250",
                  textSize: 18,
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                const IconStar(star: 4.2),
              ],
            )
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
      ],
    );
  }
}
