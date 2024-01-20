import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class ButtonDetail extends StatelessWidget {
  const ButtonDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: Dimensions.height50,
            width: Dimensions.height100,
            decoration: BoxDecoration(
              color: AppColors.borderColor,
              borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.remove,
                  color: AppColors.mainColor,
                ),
                SizedBox(
                  width: Dimensions.height5,
                ),
                TextNormal(text: "1"),
                SizedBox(
                  width: Dimensions.height5,
                ),
                const Icon(
                  Icons.add,
                  color: AppColors.mainColor,
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.height50,
            width: Dimensions.height220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
              color: AppColors.mainColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextNormal(
                  text: "Add to Cart",
                  textSize: Dimensions.font20,
                ),
                SizedBox(
                  width: Dimensions.height10,
                ),
                TextNormal(
                  text: "\$250",
                  textSize: Dimensions.font16,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
