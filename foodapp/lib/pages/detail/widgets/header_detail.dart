import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:go_router/go_router.dart';

class HeaderDetailPage extends StatelessWidget {
  const HeaderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: Dimensions.height260,
          width: double.infinity,
          child: Image.network(
              "https://th.bing.com/th/id/OIP.2g6Pd_cJS64SaEVrwA4ZqwHaHa?w=500&h=500&rs=1&pid=ImgDetMain",
              fit: BoxFit.cover),
        ),
        Positioned(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: Dimensions.height10, vertical: Dimensions.height30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => context.goNamed("home"),
                  child: Container(
                    height: Dimensions.height50,
                    width: Dimensions.height50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent.withOpacity(0.4),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.brightColor,
                      size: Dimensions.font32,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => context.goNamed("cart"),
                  child: Container(
                    height: Dimensions.height50,
                    width: Dimensions.height50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent.withOpacity(0.4),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        CupertinoIcons.cart,
                        color: AppColors.brightColor,
                        size: Dimensions.font32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
