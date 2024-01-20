import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/big_text/big_text.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class DescriptionIntroduction extends StatelessWidget {
  const DescriptionIntroduction(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.text5});

  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BigText(
          text: text1,
          color:
              Dimensions.darkmode ? AppColors.brightColor : AppColors.textColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigText(
              text: text2,
              color: Dimensions.darkmode
                  ? AppColors.brightColor
                  : AppColors.textColor,
            ),
            SizedBox(
              width: Dimensions.height10,
            ),
            BigText(
              text: text3,
              color: AppColors.mainColor,
            )
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        TextNormal(
          text: text4,
          color: AppColors.textGrayColor,
        ),
        TextNormal(
          text: text5,
          color: AppColors.textGrayColor,
        ),
      ],
    );
  }
}
