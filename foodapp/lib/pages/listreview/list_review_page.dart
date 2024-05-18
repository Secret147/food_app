import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/models/rateList.dart';
import 'package:foodapp/pages/cart/widgets/header_cart.dart';
import 'package:foodapp/pages/listreview/widget/infor_dish_review.dart';
import 'package:foodapp/pages/listreview/widget/listcomment_list_review.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/const.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListReviewPage extends StatelessWidget {
  const ListReviewPage({super.key, required this.dish});
  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: context.read<userProvider>().getListReview(dish),
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
              List<RateList> listItem = snapshot.data as List<RateList>;

              return listItem.isNotEmpty
                  ? Stack(
                      children: [
                        Column(
                          children: [
                            const HeaderCart(name: "Reviews"),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            InforDishReview(
                              dish: listItem[0].dish,
                            ),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            ListCommentListReview(
                              listRate: listItem,
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: Dimensions.height30,
                          right: Dimensions.height30,
                          child: GestureDetector(
                            onTap: () async {
                              final SharedPreferences prefs = await Const.prefs;
                              if (prefs.getString("token") != null) {
                                context.goNamed("review", extra: dish);
                              } else {
                                // ignore: use_build_context_synchronously
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    content: SizedBox(
                                      height: Dimensions.height150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.login,
                                            size: Dimensions.font32,
                                            color: AppColors.mainColor,
                                          ),
                                          SizedBox(
                                            height: Dimensions.height20,
                                          ),
                                          TextNormal(
                                            text: "Bạn cần đăng nhập trước khi",
                                            color: AppColors.textGrayColor,
                                            textSize: Dimensions.font18,
                                          ),
                                          SizedBox(
                                            height: Dimensions.height5,
                                          ),
                                          TextNormal(
                                            text: " tiến hành đặt hàng",
                                            color: AppColors.textGrayColor,
                                            textSize: Dimensions.font18,
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: SizedBox(
                                              width: Dimensions.height100,
                                              child: ButtonCustom(
                                                text: "Cancel",
                                                color: AppColors.mainColor,
                                                background:
                                                    AppColors.brightColor,
                                                textColor: AppColors.mainColor,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context.goNamed("signin");
                                            },
                                            child: SizedBox(
                                              width: Dimensions.height100,
                                              child: ButtonCustom(
                                                text: "Đăng nhập",
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: Dimensions.height60,
                              width: Dimensions.height60,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(0, 239, 5, 60)
                                      .withOpacity(0.5),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.add,
                                color: AppColors.brightColor,
                                size: Dimensions.font32,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Stack(
                      children: [
                        Column(
                          children: [
                            const HeaderCart(name: "Reviews"),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            Center(
                                child: TextDarkMode(text: "Chưa có đánh giá")),
                          ],
                        ),
                        Positioned(
                          bottom: Dimensions.height30,
                          right: Dimensions.height30,
                          child: GestureDetector(
                            onTap: () async {
                              final SharedPreferences prefs = await Const.prefs;
                              if (prefs.getString("token") != null) {
                                context.goNamed("review", extra: dish);
                              } else {
                                // ignore: use_build_context_synchronously
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    content: SizedBox(
                                      height: Dimensions.height150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.login,
                                            size: Dimensions.font32,
                                            color: AppColors.mainColor,
                                          ),
                                          SizedBox(
                                            height: Dimensions.height20,
                                          ),
                                          TextNormal(
                                            text: "Bạn cần đăng nhập trước khi",
                                            color: AppColors.textGrayColor,
                                            textSize: Dimensions.font18,
                                          ),
                                          SizedBox(
                                            height: Dimensions.height5,
                                          ),
                                          TextNormal(
                                            text: " tiến hành đặt hàng",
                                            color: AppColors.textGrayColor,
                                            textSize: Dimensions.font18,
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: SizedBox(
                                              width: Dimensions.height100,
                                              child: ButtonCustom(
                                                text: "Cancel",
                                                color: AppColors.mainColor,
                                                background:
                                                    AppColors.brightColor,
                                                textColor: AppColors.mainColor,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context.goNamed("signin");
                                            },
                                            child: SizedBox(
                                              width: Dimensions.height100,
                                              child: ButtonCustom(
                                                text: "Đăng nhập",
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: Dimensions.height60,
                              width: Dimensions.height60,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(0, 239, 5, 60)
                                      .withOpacity(0.5),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.add,
                                color: AppColors.brightColor,
                                size: Dimensions.font32,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
            }),
      ),
    );
  }
}
