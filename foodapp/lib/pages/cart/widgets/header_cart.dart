import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';

class HeaderCart extends StatelessWidget {
  const HeaderCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height30),
      height: Dimensions.height60,
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.modeColor,
          ),
          Expanded(
            child: Center(
              child: TextDarkMode(
                text: "My Cart",
                textSize: Dimensions.font20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
