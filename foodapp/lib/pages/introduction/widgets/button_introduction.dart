import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';

class ButtonIntroduction extends StatelessWidget {
  const ButtonIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.height140,
      height: Dimensions.height140,
      child: Image.asset("assets/icons/next_icon1.png", fit: BoxFit.cover),
    );
  }
}
