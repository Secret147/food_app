import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodapp/models/user.dart';
import 'package:foodapp/repositories/auth.dart';
import 'package:foodapp/repositories/userAPI.dart';
import 'package:foodapp/utils/const.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userProvider extends ChangeNotifier {
  Future<dynamic> postNewUser(dynamic user) async {
    final data = await userAPI.callAPICreateUser(user);
    notifyListeners();
    return data;
  }

  Future<dynamic> postLogin(dynamic user) async {
    final data = await userAPI.callAPILogin(user);
    notifyListeners();
    if (data.statusCode == 200) {
      Const.token = data.data["token"];
      AuthRepo.updateHeader(data.data["token"]);
      await Const.storage.write(key: "token", value: data.data["token"]);
      Dimensions.imageUser = data.data["image"];
      return "Success";
    } else {
      return data.data["message"];
    }
  }
}
