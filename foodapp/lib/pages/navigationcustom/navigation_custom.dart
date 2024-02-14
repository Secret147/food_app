import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/cart/cart_page.dart';
import 'package:foodapp/pages/home/home_page.dart';
import 'package:foodapp/pages/profile/profile_page.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/const.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigatinCustom extends StatefulWidget {
  const NavigatinCustom({super.key});

  @override
  State<NavigatinCustom> createState() => _NavigatinCustomState();
}

class _NavigatinCustomState extends State<NavigatinCustom> {
  List<Widget> listWidget = [
    const HomePage(),
    const ProfilePage(),
    const CartPage(),
    const ProfilePage()
  ];

  List<dynamic> path = ["home", "introduction", "cart", "profile"];
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> listItem = [
      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.home,
        ),
        label: "Home",
      ),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border,
          ),
          label: "Favorite"),
      const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.cart,
          ),
          label: "Cart"),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.person_2_outlined,
          ),
          label: "User"),
    ];
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(31, 243, 9, 9),
      currentIndex: Dimensions.pageActive,
      selectedItemColor: AppColors.mainColor,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      selectedFontSize: Dimensions.font16,
      selectedIconTheme: IconThemeData(
        color: AppColors.mainColor,
        size: Dimensions.font20,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.modeColor,
        size: Dimensions.font20,
      ),
      elevation: 0,
      items: listItem,
      onTap: (index) {
        setState(() async {
          final SharedPreferences prefs = await Const.prefs;
          if (prefs.getString("token") != null || path[index] == "home") {
            Dimensions.pageActive = index;
            // ignore: use_build_context_synchronously
            context.goNamed(path[index]);
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
        });
      },
    );
  }
}
