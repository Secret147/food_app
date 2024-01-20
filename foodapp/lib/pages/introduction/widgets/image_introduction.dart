import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/icon/icon.dart';

class ImageIntroduction extends StatelessWidget {
  const ImageIntroduction({super.key, this.url});
  final url;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.boxHeight,
      child: Image.asset(url, fit: BoxFit.cover),
    );

    // return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    //   SizedBox(
    //     height: Dimensions.boxHeight,
    //     child: Stack(
    //       children: [
    //         Align(
    //           alignment: Alignment.bottomCenter,
    //           child: Container(
    //             height: Dimensions.circleHeight,
    //             margin: const EdgeInsets.only(left: 5, right: 5),
    //             decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               border: Border.all(
    //                 color: AppColors.mainColor,
    //                 width: 2,
    //               ),
    //             ),
    //           ),
    //         ),
    //         Container(
    //           alignment: Alignment.center,
    //           height: Dimensions.imageHeight,
    //           margin: const EdgeInsets.only(left: 5, right: 5),
    //           decoration: const BoxDecoration(
    //             shape: BoxShape.circle,
    //           ),
    //           child:
    //               Image.asset("assets/images/Ellipse 2.png", fit: BoxFit.cover),
    //         ),
    //         IconCustom(
    //           widthIcon: Dimensions.height50,
    //           heighIcon: Dimensions.height50,
    //           url: "assets/icons/kfc_icon.png",
    //           posTop: Dimensions.height100,
    //           posLeft: Dimensions.height60,
    //         ),
    //         IconCustom(
    //           widthIcon: Dimensions.height60,
    //           heighIcon: Dimensions.height60,
    //           url: "assets/icons/mcdonalds_icon.png",
    //           posTop: Dimensions.height280,
    //           posLeft: Dimensions.height60,
    //         ),
    //         IconCustom(
    //           widthIcon: Dimensions.height34,
    //           heighIcon: Dimensions.height34,
    //           url: "assets/icons/cocacola_icon.png",
    //           posTop: Dimensions.height320,
    //           posLeft: Dimensions.height220,
    //         ),
    //         IconCustom(
    //           widthIcon: Dimensions.height40,
    //           heighIcon: Dimensions.height40,
    //           url: "assets/icons/burger-king_icon.png",
    //           posTop: Dimensions.height140,
    //           posLeft: Dimensions.height260,
    //         ),
    //       ],
    //     ),
    //   ),
    // ]);
  }
}
