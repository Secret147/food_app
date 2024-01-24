import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class PriceCart extends StatelessWidget {
  const PriceCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(
            left: Dimensions.height20,
            right: Dimensions.height20,
            top: Dimensions.height20),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: AppColors.mainColor),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextDarkMode(text: "Item Total"),
                TextDarkMode(
                  text: "\$350",
                  textSize: Dimensions.font18,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextDarkMode(text: "Discount"),
                TextDarkMode(
                  text: "\$100",
                  textSize: Dimensions.font18,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextNormal(
                  text: "Delivery",
                  color: AppColors.successTextColor,
                ),
                TextNormal(
                  text: "Free",
                  textSize: Dimensions.font18,
                  color: AppColors.successTextColor,
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(
            left: Dimensions.height20,
            right: Dimensions.height20,
            top: Dimensions.height20),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: AppColors.mainColor),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextDarkMode(
                  text: "Grand Total",
                  textSize: Dimensions.font20,
                ),
                TextDarkMode(
                  text: "\$250",
                  textSize: Dimensions.font20,
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.height20, vertical: Dimensions.height20),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: AppColors.mainColor),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextDarkMode(
                  text: "Delivery to: Home",
                  textSize: Dimensions.font18,
                ),
                TextNormal(
                  text: "Change",
                  textSize: Dimensions.font18,
                  color: AppColors.mainColor,
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: Dimensions.height20,
      ),
      Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
          child: ButtonCustom(text: "Checkout")),
    ]);
  }
}
