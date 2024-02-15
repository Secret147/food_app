import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/const.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/profileitem/profile_item.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListProfile extends StatelessWidget {
  const ListProfile(
      {super.key,
      required this.name,
      required this.phone,
      required this.email,
      required this.address});
  final String name;
  final String phone;
  final String email;
  final String address;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileItem(
          colorIcon: AppColors.successTextColor,
          text: name == "" ? "Chưa cập nhật" : name,
          icon: Icons.person,
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        ProfileItem(
          colorIcon: const Color.fromARGB(255, 215, 155, 14),
          text: phone == "" ? "Chưa cập nhật" : phone,
          icon: Icons.phone,
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        ProfileItem(
          colorIcon: const Color.fromARGB(255, 239, 10, 33),
          text: email == "" ? "Chưa cập nhật" : email,
          icon: Icons.mail,
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        ProfileItem(
          colorIcon: const Color.fromARGB(255, 239, 10, 33),
          text: address == "" ? "Chưa cập nhật" : address,
          icon: Icons.location_city,
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        GestureDetector(
          onTap: () async {
            final SharedPreferences prefs = await Const.prefs;
            prefs.remove("token");
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
