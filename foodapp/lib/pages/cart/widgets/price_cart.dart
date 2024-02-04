import 'package:flutter/material.dart';
import 'package:foodapp/models/responseordered.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class PriceCart extends StatefulWidget {
  const PriceCart({super.key, required this.ordereds});
  final List<ResponseOrdered> ordereds;

  @override
  State<PriceCart> createState() => _PriceCartState();
}

class _PriceCartState extends State<PriceCart> {
  @override
  Widget build(BuildContext context) {
    dynamic itemTotal = 0;
    dynamic discount = 100;
    dynamic delivery = 0;

    for (ResponseOrdered x in widget.ordereds) {
      itemTotal += x.dish.price * Dimensions.orderQuantity;
    }
    dynamic grandTotal = itemTotal - discount + delivery;

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
                  text: "\$$itemTotal",
                  textSize: Dimensions.font18,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextDarkMode(text: "Discount"),
                TextDarkMode(
                  text: "\$$discount",
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
                  text: delivery == 0 ? "Free" : "$delivery",
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
                  text: "\$$grandTotal",
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
