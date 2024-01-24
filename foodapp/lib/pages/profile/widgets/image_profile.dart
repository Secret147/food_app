import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        height: Dimensions.height140,
        width: Dimensions.height140,
        child: Image.network(
            "https://i.pinimg.com/564x/0b/62/0f/0b620f63aa0c3484e142add74ef26130.jpg",
            fit: BoxFit.cover),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: GestureDetector(
          onTap: () => context.goNamed("otp555"),
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(0, 245, 6, 6).withOpacity(0.8),
              ),
              height: Dimensions.height40,
              width: Dimensions.height40,
              child: const Icon(
                Icons.edit,
                color: AppColors.brightColor,
              )),
        ),
      )
    ]);
  }
}
