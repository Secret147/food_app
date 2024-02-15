import 'package:flutter/material.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/itemcustomv2/item_custom_v2.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OptionDealHomePage extends StatefulWidget {
  const OptionDealHomePage({super.key});

  @override
  State<OptionDealHomePage> createState() => _OptionDealHomePageState();
}

class _OptionDealHomePageState extends State<OptionDealHomePage> {
  List<dynamic> listDeals = [
    {"name": "Featured", "distribute": "featured"},
    {"name": "Popular", "distribute": "popular"},
    {"name": "Newest", "distribute": "newest"},
    {"name": "Trending", "distribute": "trending"},
    {"name": "Recommend", "distribute": "recommend"},
  ];

  int currentDeal = 0;

  String distribute = "featured";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: Dimensions.height30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listDeals.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (index != currentDeal) {
                    currentDeal = index;
                  }
                  distribute = listDeals[index]["distribute"];
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: Dimensions.height30),
                height: 30,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: currentDeal == index
                        ? const BorderSide(
                            width: 2.0, color: AppColors.mainColor)
                        : BorderSide(
                            width: 0, color: Colors.transparent.withOpacity(0)),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    listDeals[index]["name"],
                    style: TextStyle(
                      fontSize: Dimensions.font16,
                      color: currentDeal == index
                          ? AppColors.mainColor
                          : AppColors.modeColor,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      SizedBox(
        height: Dimensions.height30,
      ),
      FutureBuilder(
        future: context.read<userProvider>().getDishByDistribute(distribute),
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
          return Column(children: [
            SizedBox(
              height: Dimensions.height520,
              child: SingleChildScrollView(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          context.goNamed("detail", extra: listItem[index]);
                        },
                        child: ItemCustomV2(item: listItem[index]));
                  },
                ),
              ),
            ),
          ]);
        },
      ),
    ]);
  }
}
