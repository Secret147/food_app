import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:foodapp/models/userInfor.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';

class ImageProfile extends StatelessWidget {
  ImageProfile({
    super.key,
    required this.image,
    required this.user,
    this.icon = Icons.edit,
  });
  final String image;
  final UserInfor user;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        height: Dimensions.height140,
        width: Dimensions.height140,
        child: Image.network(image, fit: BoxFit.cover),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: GestureDetector(
          onTap: () => context.goNamed("editprofile", extra: user),
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(0, 245, 6, 6).withOpacity(0.8),
              ),
              height: Dimensions.height40,
              width: Dimensions.height40,
              child: Icon(
                icon,
                color: AppColors.brightColor,
              )),
        ),
      )
    ]);
  }
}
