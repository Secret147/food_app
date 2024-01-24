import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/profileitem/profile_item.dart';
import 'package:go_router/go_router.dart';

class ListProfile extends StatelessWidget {
  const ListProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileItem(
          colorIcon: AppColors.successTextColor,
          text: "Chung Nguyen",
          icon: Icons.person,
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        const ProfileItem(
          colorIcon: Color.fromARGB(255, 215, 155, 14),
          text: "0865955830",
          icon: Icons.phone,
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        const ProfileItem(
          colorIcon: Color.fromARGB(255, 239, 10, 33),
          text: "thanhchung2002xtc@gmail.com",
          icon: Icons.mail,
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        const ProfileItem(
          colorIcon: Color.fromARGB(255, 239, 10, 33),
          text: "Address",
          icon: Icons.location_city,
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        GestureDetector(
          onTap: () {
            context.goNamed('introduction');
            Dimensions.pageActive = 0;
          },
          child: const ProfileItem(
            colorIcon: Color.fromARGB(255, 239, 10, 33),
            text: "LogOut",
            icon: Icons.logout,
          ),
        ),
      ],
    );
  }
}
