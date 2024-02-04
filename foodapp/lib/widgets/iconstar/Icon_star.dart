import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class IconStar extends StatelessWidget {
  const IconStar({super.key, required this.star});
  final dynamic star;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height30,
      width: Dimensions.height60,
      decoration: BoxDecoration(
        color: AppColors.successTextColor,
        borderRadius: BorderRadius.circular(Dimensions.borderRadius15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextNormal(text: "$star"),
          SizedBox(
            width: Dimensions.height5,
          ),
          Icon(
            Icons.star,
            size: Dimensions.font16,
            color: AppColors.brightColor,
          ),
        ],
      ),
    );
  }
}
