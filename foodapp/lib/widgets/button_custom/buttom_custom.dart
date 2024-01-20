import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class ButtonCustom extends StatelessWidget {
  ButtonCustom(
      {super.key,
      required this.text,
      this.color = AppColors.mainColor,
      this.background = AppColors.mainColor,
      this.textColor = AppColors.brightColor});
  final String text;
  Color color;
  Color background;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Dimensions.height60,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
          color: background,
          border: Border.all(color: color)),
      child: Center(
          child: TextNormal(
        text: text,
        color: textColor,
      )),
    );
  }
}
