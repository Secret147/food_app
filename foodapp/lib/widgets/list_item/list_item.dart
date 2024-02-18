import 'package:flutter/material.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/iconstar/Icon_star.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListItemCustom extends StatelessWidget {
  const ListItemCustom(
      {super.key,
      required this.title,
      required this.heightItem,
      required this.widthItem,
      required this.heightImageItem,
      required this.widthImageItem,
      required this.listItem});
  final String title;
  final double heightItem;
  final double widthItem;
  final double heightImageItem;
  final double widthImageItem;
  final List<Dish> listItem;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightItem,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listItem.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.goNamed("detail", extra: listItem[index]);
              },
              child: Container(
                margin: EdgeInsets.only(right: Dimensions.height30),
                width: widthItem,
                height: heightItem,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadius15),
                  border: Border.all(
                    color: AppColors.modeColorBorder,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(Dimensions.height10),
                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        height: heightImageItem,
                        width: widthImageItem,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.borderRadius15),
                        ),
                        child: Image.network(listItem[index].image,
                            fit: BoxFit.cover),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Dimensions.height5,
                                ),
                                SizedBox(
                                  width: widthImageItem - Dimensions.height100,
                                  child: TextDarkMode(
                                    text: listItem[index].name,
                                    textSize: Dimensions.font14,
                                  ),
                                ),
                                TextNormal(
                                  text: listItem[index].provider.address,
                                  color: AppColors.textGrayColor,
                                  textSize: Dimensions.font10,
                                ),
                                SizedBox(
                                  height: Dimensions.height5,
                                ),
                                TextDarkMode(
                                  text: "\$${listItem[index].price}",
                                  textSize: Dimensions.font12,
                                ),
                              ],
                            ),
                          ),
                          IconStar(star: listItem[index].rate),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
