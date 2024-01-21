import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/cart/cart_page.dart';
import 'package:foodapp/pages/home/home_page.dart';
import 'package:foodapp/pages/profile/profile_page.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:go_router/go_router.dart';

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

  List<dynamic> path = ["home", "detail", "cart", "profile"];
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> listItem = [
      BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.home,
          size: 32,
          color: AppColors.modeColor,
        ),
        label: "Home",
      ),
      BottomNavigationBarItem(
          icon: Icon(
            size: 32,
            Icons.favorite_border,
            color: AppColors.modeColor,
          ),
          label: "Favorite"),
      BottomNavigationBarItem(
          icon: Icon(
            size: 32,
            CupertinoIcons.cart,
            color: AppColors.modeColor,
          ),
          label: "Cart"),
      BottomNavigationBarItem(
          icon: Icon(
            size: 32,
            Icons.person,
            color: AppColors.modeColor,
          ),
          label: "User"),
    ];
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(31, 243, 9, 9),
      currentIndex: Dimensions.pageActive,
      selectedItemColor: AppColors.modeColor,
      selectedFontSize: Dimensions.font16,
      elevation: 0,
      items: listItem,
      onTap: (index) {
        setState(() {
          Dimensions.pageActive = index;
          context.goNamed(path[index]);
        });
      },
    );
  }
}
