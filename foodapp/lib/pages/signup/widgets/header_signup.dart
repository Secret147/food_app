import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';

class HeaderSignUp extends StatelessWidget {
  const HeaderSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height80,
      width: Dimensions.height80,
      child: Image.asset(
        "assets/icons/logo.png",
        color: AppColors.mainColor,
      ),
    );
  }
}
