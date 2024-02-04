import 'package:flutter/cupertino.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/ExpandText/expand_text.dart';
import 'package:foodapp/widgets/iconstar/Icon_star.dart';
import 'package:foodapp/widgets/pos_icon/pos_icon_text.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class InforDetail extends StatelessWidget {
  const InforDetail(
      {super.key,
      required this.name,
      required this.address,
      this.price,
      this.rate});
  final String name;
  final String address;
  final dynamic price;
  final dynamic rate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: Dimensions.height20),
                    child: TextDarkMode(
                      text: name,
                      textSize: Dimensions.font20,
                    )),
                PosIconText(pos: address),
              ],
            ),
            Column(
              children: [
                TextDarkMode(
                  text: "\$$price",
                  textSize: 18,
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                IconStar(star: rate),
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
