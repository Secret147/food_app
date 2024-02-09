import 'package:flutter/material.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/itemcustomv2/item_custom_v2.dart';
import 'package:provider/provider.dart';

class OptionDealHomePage extends StatelessWidget {
  OptionDealHomePage({super.key});

  List<dynamic> listDeals = ["bun", "mien", "com", "che", "man"];

  int currentDeal = 0;

  final ValueNotifier<String> type = ValueNotifier<String>("mien");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return SizedBox(
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
                        type.value = listDeals[index];
                        print(type.value);
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
                                  width: 0,
                                  color: Colors.transparent.withOpacity(0)),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          listDeals[index],
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
            );
          },
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        ValueListenableBuilder(
          valueListenable: type,
          builder: (BuildContext context, String value, Widget? child) {
            return FutureBuilder(
              future: context.read<userProvider>().getDishByType(value),
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
                          return ItemCustomV2(item: listItem[index]);
                        },
                      ),
                    ),
                  ),
                ]);
              },
            );
          },
        )
      ],
    );
  }
}
