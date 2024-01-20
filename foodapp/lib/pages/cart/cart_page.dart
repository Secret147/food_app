import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/cart/widgets/header_cart.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/itemcustomv2/item_custom_v2.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 1);
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const HeaderCart(),
          SizedBox(
            height: Dimensions.height30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
            height: Dimensions.height520,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 140,
                  width: double.infinity,
                  child: PageView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(child: ItemCustomV2()),
                      Container(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: Dimensions.height30,
                              bottom: Dimensions.height40,
                              left: Dimensions.height20),
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.borderRadius10),
                            border: Border.all(color: AppColors.mainColor),
                          ),
                          child: Icon(
                            CupertinoIcons.delete,
                            color: AppColors.mainColor,
                            size: Dimensions.font32,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
