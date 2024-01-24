import 'package:flutter/material.dart';
import 'package:foodapp/pages/introduction/widgets/button_introduction.dart';
import 'package:foodapp/pages/introduction/widgets/description_introduction.dart';
import 'package:foodapp/pages/introduction/widgets/header_introduction.dart';
import 'package:foodapp/pages/introduction/widgets/image_introduction.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> data = [
      {
        "url": "assets/images/pic1.png",
        "text1": "Search Your",
        "text2": "Favourite",
        "text3": "Food",
        "text4": "Discover the foods from over",
        "text5": " all nearby restaurants."
      },
      {
        "url": "assets/images/pic2.png",
        "text1": "Browse Your",
        "text2": "",
        "text3": "Menu",
        "text4": "Find Your Favourit Food anytime from",
        "text5": "our existing location easily"
      },
      {
        "url": "assets/images/pic4.png",
        "text1": "Get Fastest",
        "text2": "",
        "text3": "Delivery",
        "text4": "Find delivery to your home,",
        "text5": " office and wherever you are"
      }
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          GestureDetector(
              onTap: () => context.goNamed("signin"),
              child: const HeaderIntroduction()),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageIntroduction(
                  url: data[index]['url'],
                ),
                DescriptionIntroduction(
                  text1: data[index]['text1'],
                  text2: data[index]['text2'],
                  text3: data[index]['text3'],
                  text4: data[index]['text4'],
                  text5: data[index]['text5'],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (index < 2) {
                        index = index + 1;
                      } else {
                        context.goNamed("signup");
                      }
                    });
                    if (index > 2) {
                      index = 0;
                    }
                  },
                  child: const ButtonIntroduction(),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
