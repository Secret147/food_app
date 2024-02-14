import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:go_router/go_router.dart';

class OptionHomePage extends StatelessWidget {
  const OptionHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    List<dynamic> listOptions = [
      {"name": "Cơm", "url": "assets/icons/com.png", "type": "com"},
      {"name": "Mặn", "url": "assets/icons/man.png", "type": "man"},
      {"name": "Bún", "url": "assets/icons/bun.png", "type": "bun"},
      {"name": "Chè", "url": "assets/icons/che.png", "type": "che"},
      {"name": "Miến", "url": "assets/icons/mien.png", "type": "mien"},
    ];
    return SizedBox(
      height: Dimensions.height140,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listOptions.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => context.goNamed("type", extra: {
                "name": listOptions[index]["name"],
                "type": listOptions[index]["type"]
              }),
              child: Container(
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
                            boxShadow: [
                              BoxShadow(
                                color: Dimensions.darkmode
                                    ? const Color.fromARGB(255, 127, 126, 126)
                                        .withOpacity(0)
                                    : const Color.fromARGB(255, 127, 126, 126)
                                        .withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(3, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(
                                Dimensions.borderRadius10),
                            color: Dimensions.darkmode
                                ? AppColors.iconColor
                                : AppColors.brightColor,
                          ),
                          child: Image.asset(listOptions[index]["url"],
                              fit: BoxFit.cover),
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        TextDarkMode(text: listOptions[index]["name"]),
                      ],
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
