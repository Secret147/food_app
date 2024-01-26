import 'package:flutter/material.dart';
import 'package:foodapp/models/user.dart';
import 'package:foodapp/repositories/userAPI.dart';

class userProvider extends ChangeNotifier {
  Future<dynamic> postNewUser(dynamic user) async {
    final data = userAPI.callAPICreateUser(user);
    notifyListeners();
    return data;
  }

  Future<dynamic> postLogin(dynamic user) async {
    final data = userAPI.callAPILogin(user);
    notifyListeners();
    return data;
  }
}
