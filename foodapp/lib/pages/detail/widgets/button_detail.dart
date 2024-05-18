// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/ordered.dart';
import 'package:foodapp/pages/cart/cart_page.dart';
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

class ButtonDetail extends StatefulWidget {
  const ButtonDetail({
    Key? key,
    required this.price,
    this.dish,
  }) : super(key: key);
  final dynamic price;
  final dynamic dish;

  @override
  State<ButtonDetail> createState() => _ButtonDetailState();
}

class _ButtonDetailState extends State<ButtonDetail> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => context.goNamed("listreview", extra: widget.dish),
          child: Container(
            height: Dimensions.height50,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextDarkMode(
                  text: "Xem đánh giá",
                  textSize: Dimensions.font20,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.modeColor,
                  size: Dimensions.font32,
                )
              ],
            ),
          ),
        ),
        Container(
          height: Dimensions.height100,
          margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
          decoration: const BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: Dimensions.height50,
                width: Dimensions.height100,
                decoration: BoxDecoration(
                  color: AppColors.borderColor,
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadius10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (index > 1) {
                            index--;
                            print(index);
                          }
                        });
                      },
                      child: const Icon(
                        Icons.remove,
                        color: AppColors.mainColor,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.height5,
                    ),
                    TextNormal(text: "$index"),
                    SizedBox(
                      width: Dimensions.height5,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index++;
                          print(index);
                        });
                      },
                      child: const Icon(
                        Icons.add,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final SharedPreferences prefs = await Const.prefs;
                  if (prefs.getString("token") != null) {
                    Ordered ordered =
                        Ordered(dish: widget.dish, quantity: index);

                    // ignore: use_build_context_synchronously
                    await context.read<userProvider>().postNewOrder(ordered);
                    // ignore: use_build_context_synchronously
                    context.go("/cart");
                    Dimensions.pageActive = 1;
                  } else {
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        content: SizedBox(
                          height: Dimensions.height150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    background: AppColors.brightColor,
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
                  height: Dimensions.height50,
                  width: Dimensions.height220,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius10),
                    color: AppColors.mainColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextNormal(
                        text: "Add to Cart",
                        textSize: Dimensions.font20,
                      ),
                      SizedBox(
                        width: Dimensions.height10,
                      ),
                      TextNormal(
                        text: "\$${index * widget.price}",
                        textSize: Dimensions.font16,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
