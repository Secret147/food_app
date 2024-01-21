import 'package:flutter/cupertino.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/pos_icon/pos_icon_text.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: Dimensions.height10),
                  child: TextDarkMode(
                      text: "Delivery to", textSize: Dimensions.font18)),
              const PosIconText(pos: "Dong Da, Ha Noi"),
            ],
          ),
          GestureDetector(
            onTap: () => context.goNamed("proflie"),
            child: Container(
              height: Dimensions.height50,
              width: Dimensions.height50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child:
                  Image.asset("assets/images/Ellipse 6.png", fit: BoxFit.cover),
            ),
          )
        ],
      ),
    );
  }
}
