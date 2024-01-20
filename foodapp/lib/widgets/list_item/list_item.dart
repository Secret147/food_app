import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/iconstar/Icon_star.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';

class ListItemCustom extends StatelessWidget {
  const ListItemCustom(
      {super.key,
      required this.title,
      required this.heightItem,
      required this.widthItem,
      required this.url});
  final String title;
  final double heightItem;
  final double widthItem;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextDarkMode(text: title),
        SizedBox(
          height: Dimensions.height10,
        ),
        SizedBox(
          height: heightItem,
          child: Align(
            alignment: Alignment.centerLeft,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => context.goNamed("detail"),
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.borderRadius15),
                            ),
                            child: Image.network(url),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextDarkMode(
                                    text: "Drumsteak Thai Ha",
                                    textSize: Dimensions.font14,
                                  ),
                                  TextNormal(
                                    text: "Dong Da, Ha Noi",
                                    color: AppColors.textGrayColor,
                                    textSize: Dimensions.font10,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextDarkMode(
                                    text: "\$250",
                                    textSize: Dimensions.font12,
                                  ),
                                ],
                              ),
                              const IconStar(star: 4.2),
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
        )
      ],
    );
  }
}
