import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/providers/userProvider.dart';

import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/const.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHomePage extends StatefulWidget {
  const SearchHomePage({super.key});

  @override
  State<SearchHomePage> createState() => _SearchHomePageState();
}

class _SearchHomePageState extends State<SearchHomePage> {
  @override
  Widget build(BuildContext context) {
    Color darkmode =
        Dimensions.darkmode ? AppColors.brightColor : AppColors.textColor;
    return FutureBuilder(
      future: context.read<userProvider>().getDish(),
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
        return SizedBox(
          height: Dimensions.height60,
          child: Row(children: [
            Expanded(
              child: GestureDetector(
                onTap: () => context.goNamed("search", extra: listItem),
                child: Container(
                  height: Dimensions.height60,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.borderRadius10),
                      border:
                          Border.all(color: AppColors.textGrayColor, width: 2)),
                  child: Row(children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: Dimensions.height10),
                      child: Icon(
                        Icons.search,
                        color: darkmode,
                        size: Dimensions.font32,
                      ),
                    ),
                    Text(
                      "Enter Search",
                      style: TextStyle(
                        color: darkmode,
                        fontSize: Dimensions.font16,
                      ),
                    )
                  ]),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                context.goNamed("payment");
              },
              child: Container(
                width: Dimensions.height60,
                margin: EdgeInsets.only(left: Dimensions.height20),
                height: Dimensions.height60,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadius10),
                  color: AppColors.mainColor,
                ),
                child: const Icon(
                  Icons.menu,
                  color: AppColors.brightColor,
                ),
              ),
            )
          ]),
        );
      },
    );
  }
}
