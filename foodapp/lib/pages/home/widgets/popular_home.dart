import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class PopularHomePage extends StatelessWidget {
  const PopularHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextDarkMode(text: "Popular near you"),
        SizedBox(
          height: Dimensions.height10,
        ),
        SizedBox(
          height: Dimensions.height260,
          child: Align(
            alignment: Alignment.centerLeft,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              controller: pageController,
              dragStartBehavior: DragStartBehavior.start,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: Dimensions.height30),
                  width: Dimensions.height260,
                  height: Dimensions.height260,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius15),
                    border: Border.all(
                      color: AppColors.borderColor,
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
                          child: Image.network(
                              "https://th.bing.com/th/id/OIP.1NNDNGNM-UxNYHTsln-tigHaE7?rs=1&pid=ImgDetMain"),
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
                            Container(
                              height: Dimensions.height30,
                              width: Dimensions.height60,
                              decoration: BoxDecoration(
                                color: AppColors.successTextColor,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.borderRadius15),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextNormal(text: "4.2"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    size: 16,
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
              },
            ),
          ),
        )
      ],
    );
  }
}
