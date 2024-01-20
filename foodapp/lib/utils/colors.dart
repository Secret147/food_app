import 'dart:ui';

import 'package:foodapp/utils/dimensions.dart';

class AppColors {
  static const Color darkColor = Color(0XFF1E0909);
  static const Color brightColor = Color(0XFFFFFFFF);
  static const Color mainColor = Color(0XFFEF2E2E);
  static const Color textColor = Color(0XFF000000);
  static const Color successTextColor = Color(0XFF34C759);
  static const Color buttonStartColor = Color(0XFFFCC45E);
  static const Color borderColor = Color(0XFF553434);
  static const Color textGrayColor = Color(0XFF979797);
  static const Color iconColor = Color(0XFF230F0F);
  static Color modeColor =
      Dimensions.darkmode ? AppColors.brightColor : AppColors.textColor;
  static Color modeColorBorder =
      Dimensions.darkmode ? AppColors.borderColor : AppColors.textGrayColor;
}
