import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';

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
            "https://i.pinimg.com/736x/54/cd/69/54cd69b276f1ca5fa1c5a35356a8c5ff.jpg",
            fit: BoxFit.cover),
      ),
      Positioned(
        bottom: 0,
        right: 0,
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
      )
    ]);
  }
}
