import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:go_router/go_router.dart';

class HeaderCart extends StatelessWidget {
  const HeaderCart({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      height: Dimensions.height60,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Dimensions.pageActive = 0;
              context.goNamed("home");
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.modeColor,
            ),
          ),
          Expanded(
            child: Center(
              child: TextDarkMode(
                text: name,
                textSize: Dimensions.font20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
