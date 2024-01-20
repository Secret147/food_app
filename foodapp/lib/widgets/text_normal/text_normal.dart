// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';

class TextNormal extends StatelessWidget {
  final String text;
  double textSize;
  Color color;
  TextOverflow overflow;

  TextNormal({
    Key? key,
    required this.text,
    this.textSize = 0,
    this.color = AppColors.brightColor,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize == 0 ? Dimensions.font16 : textSize,
        overflow: overflow,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
