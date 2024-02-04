import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodapp/models/responseordered.dart';
import 'package:foodapp/models/user.dart';
import 'package:foodapp/repositories/auth.dart';
import 'package:foodapp/repositories/dishAPI.dart';
import 'package:foodapp/repositories/orderedAPI.dart';
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
    final SharedPreferences prefs = await Const.prefs;
    notifyListeners();
    if (data.statusCode == 200) {
      prefs.setString("token", data.data["token"]);
      prefs.setString("image", data.data["image"]);

      return "Success";
    } else {
      return data.data["message"];
    }
  }

  Future<List<dynamic>> getDishPopular() async {
    final data = await dishAPI.getDishPopular();
    notifyListeners();
    return data;
  }

  Future<List<dynamic>> getDishDetail(dynamic id) async {
    final data = await dishAPI.getDishDetail(id);
    notifyListeners();
    return data;
  }

  Future<dynamic> postNewOrder(dynamic ordered) async {
    final data = await OrderedAPI.addTocart(ordered);
    notifyListeners();
    return data;
  }

  Future<List<dynamic>> getOrdered() async {
    final data = await OrderedAPI.callAPIgetOrdered();
    notifyListeners();
    return data;
  }

  Future<dynamic> addQuantity(ResponseOrdered order) async {
    final data = await OrderedAPI.callAPIaddQuantity(order);
    notifyListeners();
    return data;
  }
}
