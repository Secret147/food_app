import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';

class OptionHomePage extends StatelessWidget {
  const OptionHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return SizedBox(
      height: Dimensions.height140,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          controller: pageController,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.only(right: Dimensions.height10),
                width: Dimensions.height80,
                height: Dimensions.height100,
                child: Container(
                  margin: EdgeInsets.all(Dimensions.height10),
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      Container(
                        height: Dimensions.height60,
                        width: Dimensions.height60,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.borderRadius10),
                          color: AppColors.iconColor,
                        ),
                        child: Image.asset("assets/icons/pizza 1.png"),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      TextDarkMode(text: "Pizza"),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
