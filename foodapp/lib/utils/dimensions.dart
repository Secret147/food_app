import 'package:flutter/material.dart';

class Dimensions {
  static late double heightValue;
  static late double widthValue;
  static late double heightScreen;
  static late double widthScreen;

  static bool darkmode = true;

  //height
  static late double height10;
  static late double height20;
  static late double height34;
  static late double height30;
  static late double height40;
  static late double height50;
  static late double height60;
  static late double height80;

  static late double height100;
  static late double height140;
  static late double height150;
  static late double height170;
  static late double height220;
  static late double height260;
  static late double height280;
  static late double height320;
  static late double imageHeight;
  static late double boxHeight;
  static late double circleHeight;

  //width

  //font-size
  static late double font10;
  static late double font12;
  static late double font14;
  static late double font16;
  static late double font18;
  static late double font32;
  static late double font20;

  //border
  static late double borderRadius10;
  static late double borderRadius15;

  void init(BuildContext context) {
    heightValue = MediaQuery.of(context).size.height;
    widthValue = MediaQuery.of(context).size.width;

    heightScreen = heightValue > widthValue ? heightValue : widthValue;
    widthScreen = heightValue < widthValue ? heightValue : widthValue;

    //height

    imageHeight = heightScreen / 2.56;
    boxHeight = heightScreen / 2.34;
    circleHeight = heightScreen / 3;
    height10 = heightScreen / 84.4;
    height20 = heightScreen / 42.2;
    height34 = heightScreen / 24.82;
    height30 = heightScreen / 28.1;
    height40 = heightScreen / 21.1;
    height50 = heightScreen / 16.88;
    height60 = heightScreen / 14;
    height80 = heightScreen / 10.55;
    height100 = heightScreen / 8.44;
    height140 = heightScreen / 6;
    height150 = heightScreen / 5.62;
    height170 = heightScreen / 4.96;
    height220 = heightScreen / 3.83;
    height260 = heightScreen / 3.24;
    height280 = heightScreen / 3;
    height320 = heightScreen / 2.63;

//font-size
    font10 = heightScreen / 84.4;
    font12 = heightScreen / 70.3;
    font14 = heightScreen / 60.28;
    font16 = heightScreen / 52.75;
    font18 = heightScreen / 46.8;
    font20 = heightScreen / 42.2;
    font32 = heightScreen / 26.375;

    //border
    borderRadius10 = heightScreen / 84.4;
    borderRadius15 = heightScreen / 56.2;
  }
}
