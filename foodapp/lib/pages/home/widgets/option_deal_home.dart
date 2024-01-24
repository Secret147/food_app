import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/itemcustomv2/item_custom_v2.dart';

class OptionDealHomePage extends StatefulWidget {
  const OptionDealHomePage({super.key});

  @override
  State<OptionDealHomePage> createState() => _OptionDealHomePageState();
}

class _OptionDealHomePageState extends State<OptionDealHomePage> {
  List<dynamic> listDeals = [
    "Featured",
    "Popular",
    "Newest",
    "Trending",
    "Recommend"
  ];
  int currentDeal = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        SizedBox(
          height: Dimensions.height520,
          child: SingleChildScrollView(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const ItemCustomV2();
              },
            ),
          ),
        )
      ],
    );
  }
}
