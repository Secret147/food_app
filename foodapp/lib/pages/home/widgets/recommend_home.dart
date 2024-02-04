import 'package:flutter/material.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/list_item/list_item.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:provider/provider.dart';

class RecommendHomePage extends StatelessWidget {
  const RecommendHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextDarkMode(text: "Recommend"),
        SizedBox(
          height: Dimensions.height10,
        ),
        FutureBuilder(
            future: context.read<userProvider>().getDishPopular(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return Container(
                  child: const Text("Not connecting"),
                );
              }
              List<Dish> listItem = snapshot.data as List<Dish>;

              return ListItemCustom(
                title: "Recommend",
                heightItem: Dimensions.height220,
                widthItem: Dimensions.height220,
                listItem: listItem,
                heightImageItem: Dimensions.height130,
                widthImageItem: Dimensions.height200,
              );
            })
      ],
    );
  }
}
