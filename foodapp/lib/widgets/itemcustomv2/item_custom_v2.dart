import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class ItemCustomV2 extends StatelessWidget {
  const ItemCustomV2({super.key, required this.item});
  final Dish item;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height20),
      height: Dimensions.height140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.borderRadius15),
        border: Border.all(
          color: AppColors.modeColorBorder,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(Dimensions.height10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.borderRadius15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius15),
                  ),
                  height: Dimensions.height110,
                  width: Dimensions.height110,
                  child: Image.network(item.image, fit: BoxFit.cover),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: Dimensions.height10,
                      horizontal: Dimensions.height20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Dimensions.height100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextDarkMode(text: item.name),
                            TextNormal(
                              text: item.provider.address,
                              textSize: Dimensions.font14,
                              color: AppColors.textGrayColor,
                            ),
                          ],
                        ),
                      ),
                      TextDarkMode(
                        text: "\$${item.price}",
                        textSize: Dimensions.font18,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.alarm,
                      color: AppColors.mainColor,
                    ),
                    SizedBox(
                      width: Dimensions.height5,
                    ),
                    TextDarkMode(
                      text: "12 min",
                      textSize: Dimensions.font14,
                    )
                  ],
                ),
                Container(
                  height: Dimensions.height30,
                  width: Dimensions.height60,
                  decoration: BoxDecoration(
                    color: AppColors.successTextColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius15),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextNormal(text: item.provider.rate),
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
