import 'package:flutter/cupertino.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:get/get.dart';

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
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.location_solid,
                    color: AppColors.mainColor,
                    size: 30,
                  ),
                  SizedBox(
                    height: Dimensions.height50,
                  ),
                  TextNormal(
                    text: "Dong Da, Ha Noi",
                    color: AppColors.textGrayColor,
                  )
                ],
              )
            ],
          ),
          Container(
            height: Dimensions.height50,
            width: Dimensions.height50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child:
                Image.asset("assets/images/Ellipse 6.png", fit: BoxFit.cover),
          )
        ],
      ),
    );
  }
}