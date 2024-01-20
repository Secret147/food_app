import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class ItemCustomV2 extends StatelessWidget {
  const ItemCustomV2({super.key});

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
                  child: Image.network(
                      "https://th.bing.com/th/id/R.09048de787f20688b1e4c521acee4fd1?rik=ab%2fo%2fXJDwkMWdQ&riu=http%3a%2f%2fculinarydestinations.net%2fwp-content%2fuploads%2f2015%2f10%2fsaigon-vietnamese-food.jpg&ehk=6zi4inpuCwFqRdVHn1PHX6HChcf6sWcehIQVIcUv8RM%3d&risl=&pid=ImgRaw&r=0",
                      fit: BoxFit.cover),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: Dimensions.height10,
                      horizontal: Dimensions.height20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextDarkMode(text: "Grill Shrimp"),
                          TextNormal(
                            text: "Westren cuisine",
                            textSize: Dimensions.font14,
                            color: AppColors.textGrayColor,
                          ),
                        ],
                      ),
                      TextDarkMode(
                        text: "\$250",
                        textSize: 18,
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
                    const SizedBox(
                      width: 5,
                    ),
                    TextDarkMode(
                      text: "24 min",
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
                      TextNormal(text: "4.2"),
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
