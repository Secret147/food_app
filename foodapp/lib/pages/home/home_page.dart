import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodapp/pages/home/widgets/header_home.dart';
import 'package:foodapp/pages/home/widgets/option_deal_home.dart';
import 'package:foodapp/pages/home/widgets/option_home.dart';
import 'package:foodapp/pages/home/widgets/popular_home.dart';

import 'package:foodapp/pages/home/widgets/search_home_page.dart';
import 'package:foodapp/pages/navigationcustom/navigation_custom.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/itemcustomv2/item_custom_v2.dart';
import 'package:foodapp/widgets/list_item/list_item.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color darkmode =
        Dimensions.darkmode ? AppColors.brightColor : AppColors.textColor;

    return Scaffold(
      bottomNavigationBar: const NavigatinCustom(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(Dimensions.height20),
          child: Column(
            children: [
              const HeaderHomePage(),
              SizedBox(
                height: Dimensions.height10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SearchHomePage(),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      ListItemCustom(
                        title: "Popular near you",
                        heightItem: Dimensions.height260,
                        widthItem: Dimensions.height260,
                        url:
                            "https://th.bing.com/th/id/OIP.1NNDNGNM-UxNYHTsln-tigHaE7?rs=1&pid=ImgDetMain",
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      const OptionHomePage(),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      ListItemCustom(
                        title: "Recommend",
                        heightItem: Dimensions.height220,
                        widthItem: Dimensions.height220,
                        url:
                            "https://th.bing.com/th/id/OIP.B02RKb6NI2CB276dKOiejAHaE7?rs=1&pid=ImgDetMain",
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      const OptionDealHomePage(),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
