import 'package:flutter/material.dart';
import 'package:foodapp/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dimensions {
  static String imageUser =
      "https://i.pinimg.com/564x/e9/0e/d3/e90ed3e66a560ee0698edaf5fdbb2d72.jpg";
  static late double heightValue;
  static late double widthValue;
  static late double heightScreen;
  static late double widthScreen;

  static bool darkmode = false;
  static int pageActive = 0;
  static int orderQuantity = 1;
  static Future<String?> getShared(String key) async {
    final SharedPreferences prefs = await Const.prefs;
    String value = prefs.getString(key).toString();
    return value;
  }

  //height
  static late double height2;
  static late double height5;
  static late double height10;
  static late double height20;
  static late double height34;
  static late double height30;
  static late double height40;
  static late double height50;
  static late double height60;
  static late double height80;

  static late double height100;
  static late double height110;
  static late double height130;
  static late double height140;
  static late double height150;
  static late double height170;
  static late double height200;
  static late double height220;
  static late double height260;
  static late double height280;
  static late double height320;
  static late double height400;
  static late double height480;
  static late double height520;
  static late double height600;
  static late double height720;
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
  static late double font40;

  //border
  static late double borderRadius10;
  static late double borderRadius15;

  void init(BuildContext context) {
    heightScreen = MediaQuery.of(context).size.height;
    widthScreen = MediaQuery.of(context).size.width;

    //height
    height2 = heightScreen / 844;
    height5 = heightScreen / 176.8;
    height10 = heightScreen / 84.4;
    height20 = heightScreen / 42.2;
    height34 = heightScreen / 24.82;
    height30 = heightScreen / 28.1;
    height40 = heightScreen / 21.1;
    height50 = heightScreen / 16.88;
    height60 = heightScreen / 14;
    height80 = heightScreen / 10.55;
    height100 = heightScreen / 8.44;
    height110 = heightScreen / 7.67;
    height130 = heightScreen / 6.49;
    height140 = heightScreen / 6;
    height150 = heightScreen / 5.62;
    height170 = heightScreen / 4.96;
    height200 = heightScreen / 4.22;
    height220 = heightScreen / 3.83;
    height260 = heightScreen / 3.24;
    height280 = heightScreen / 3;
    height320 = heightScreen / 2.63;
    height400 = heightScreen / 2.11;
    height480 = heightScreen / 1.76;
    height520 = heightScreen / 1.62;
    height600 = heightScreen / 1.4;
    height720 = heightScreen / 1.172;
    imageHeight = heightScreen / 2.56;
    boxHeight = heightScreen / 2.34;
    circleHeight = heightScreen / 3;

//font-size
    font10 = heightScreen / 84.4;
    font12 = heightScreen / 70.3;
    font14 = heightScreen / 60.28;
    font16 = heightScreen / 52.75;
    font18 = heightScreen / 46.8;
    font20 = heightScreen / 42.2;
    font32 = heightScreen / 26.375;
    font40 = heightScreen / 21.1;

    //border
    borderRadius10 = heightScreen / 84.4;
    borderRadius15 = heightScreen / 56.2;
  }
}
