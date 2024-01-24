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
        setState(() {
          Dimensions.pageActive = index;
          context.goNamed(path[index]);
        });
      },
    );
  }
}
