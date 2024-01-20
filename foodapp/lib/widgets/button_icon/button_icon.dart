import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';

class ButtonIconCustom extends StatelessWidget {
  const ButtonIconCustom({
    super.key,
    required this.text,
    required this.icon,
    required this.heightIcon,
    required this.widthIcon,
  });
  final String text;
  final String icon;
  final double heightIcon;
  final double widthIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: heightIcon,
      height: widthIcon,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
          border: Border.all(color: AppColors.textGrayColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon),
          SizedBox(
            width: Dimensions.height10,
          ),
          TextDarkMode(
            text: text,
          )
        ],
      ),
    );
  }
}
