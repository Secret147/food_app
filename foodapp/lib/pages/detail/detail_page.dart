import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/pages/detail/widgets/button_detail.dart';
import 'package:foodapp/pages/detail/widgets/header_detail.dart';
import 'package:foodapp/pages/detail/widgets/infor_detail.dart';
import 'package:foodapp/pages/navigationcustom/navigation_custom.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/const.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/ExpandText/expand_text.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/iconstar/Icon_star.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.item,
  });
  final Dish item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              final SharedPreferences prefs = await Const.prefs;
              String? token = prefs.getString("token");
              if (token != null) {
                context.goNamed("review", extra: item);
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
                            text: "Bạn chưa tiến hành đăng nhập.",
                            color: AppColors.textGrayColor,
                            textSize: Dimensions.font16,
                          ),
                          SizedBox(
                            height: Dimensions.height5,
                          ),
                          TextNormal(
                            text: " Vui lòng đăng nhập để tiếp tục",
                            color: AppColors.textGrayColor,
                            textSize: Dimensions.font16,
                          ),
                          SizedBox(
                            height: Dimensions.height5,
                          ),
                          TextNormal(
                            text: " thao tác",
                            color: AppColors.textGrayColor,
                            textSize: Dimensions.font16,
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
            child: HeaderDetailPage(
              image: item.image,
            ),
          ),
          Container(
            margin: EdgeInsets.all(Dimensions.height10),
            child: Column(children: [
              SizedBox(
                height: Dimensions.height10,
              ),
              InforDetail(
                  address: item.position,
                  name: item.name,
                  price: item.price,
                  rate: item.rate),
            ]),
          ),
          Expanded(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: Dimensions.height20,
                    right: Dimensions.height20,
                    bottom: Dimensions.height20),
                child: ExpandText(
                  text: item.description,
                )),
          ),
          ButtonDetail(
            price: item.price,
            dish: item,
          ),
        ],
      ),
    );
  }
}
