// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';

class IconCustom extends StatelessWidget {
  double widthIcon;
  double heighIcon;
  String url;
  double posTop;
  double posLeft;
  IconCustom({
    Key? key,
    required this.widthIcon,
    required this.heighIcon,
    required this.url,
    required this.posTop,
    required this.posLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: posTop,
      left: posLeft,
      child: Container(
        width: widthIcon,
        height: heighIcon,
        decoration: BoxDecoration(
          color: AppColors.brightColor,
          borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
        ),
        child: Image.asset(
          url,
        ),
      ),
    );
  }
}
