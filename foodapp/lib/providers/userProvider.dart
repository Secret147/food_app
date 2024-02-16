import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodapp/models/mail.dart';
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
  //***********************************************************User***************************** */
  Future<dynamic> postNewUser(dynamic user) async {
    final data = await userAPI.callAPICreateUser(user);
    notifyListeners();
    return data;
  }

  Future<dynamic> sendMail(String mail, Mail mailBody) async {
    final data = await userAPI.callAPISendEmail(mail, mailBody);
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

  Future<dynamic> getUserInfor() async {
    final data = await userAPI.callAPIGetInfor();
    notifyListeners();
    return data;
  }

  //'''''''''''''''''''''''''' Dish .......................................

  Future<List<dynamic>> getDishPopular() async {
    final data = await dishAPI.getDishPopular();
    notifyListeners();
    return data;
  }

  Future<List<dynamic>> getDish() async {
    final data = await dishAPI.getDish();
    notifyListeners();
    return data;
  }

  Future<List<dynamic>> getDishRecommend() async {
    final data = await dishAPI.getDishRecommend();
    notifyListeners();
    return data;
  }

  Future<List<dynamic>> getDishByType(dynamic type) async {
    final data = await dishAPI.getDishByType(type);
    notifyListeners();
    return data;
  }

  Future<List<dynamic>> getDishByDistribute(dynamic distribute) async {
    final data = await dishAPI.getDishByDistribute(distribute);
    notifyListeners();
    return data;
  }

  Future<List<dynamic>> getDishDetail(dynamic id) async {
    final data = await dishAPI.getDishDetail(id);
    notifyListeners();
    return data;
  }

  //*********************************************ordered***************************** */

  Future<dynamic> postNewOrder(dynamic ordered) async {
    final data = await OrderedAPI.addTocart(ordered);
    // Update the orders list with the new order
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

  Future<dynamic> removeQuantity(ResponseOrdered order) async {
    final data = await OrderedAPI.callAPIremoveQuantity(order);
    notifyListeners();
    return data;
  }

  Future<dynamic> deleteOdered(dynamic id) async {
    final data = await OrderedAPI.callAPIdeleteOrdered(id);
    notifyListeners();
    return data;
  }
}
