import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodapp/models/bill.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/models/mail.dart';
import 'package:foodapp/models/rate.dart';
import 'package:foodapp/models/responseordered.dart';
import 'package:foodapp/models/user.dart';
import 'package:foodapp/models/userInfor.dart';
import 'package:foodapp/repositories/auth.dart';
import 'package:foodapp/repositories/billAPI.dart';
import 'package:foodapp/repositories/dishAPI.dart';
import 'package:foodapp/repositories/orderedAPI.dart';
import 'package:foodapp/repositories/rateAPI.dart';
import 'package:foodapp/repositories/userAPI.dart';
import 'package:foodapp/utils/const.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userProvider extends ChangeNotifier {
  //***********************************************************User***************************** */
  Future<dynamic> postNewUser(dynamic user) async {
    final data = await userAPI.callAPICreateUser(user);
    print(data);
    notifyListeners();
    return data;
  }

  Future<dynamic> sendMail(String mail, Mail mailBody) async {
    final data = await userAPI.callAPISendEmail(mail, mailBody);
    notifyListeners();
    return data;
  }

  Future<dynamic> sendMailPassword(String mail) async {
    final data = await userAPI.callAPISendPassword(mail);
    notifyListeners();
    if (data.statusCode == 200) {
      return "Success";
    } else {
      return "Fail";
    }
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

  Future<String> getUserAvatar() async {
    final SharedPreferences prefs = await Const.prefs;
    String img = "";

    if (prefs.getString("token") == null) {
      img =
          "https://i.pinimg.com/564x/e9/0e/d3/e90ed3e66a560ee0698edaf5fdbb2d72.jpg";
    } else {
      img = prefs.getString("image").toString();
    }
    notifyListeners();
    return img;
  }

  Future<dynamic> getUserInfor() async {
    final data = await userAPI.callAPIGetInfor();
    notifyListeners();
    return data;
  }

  Future<dynamic> putUserInfor(UserInfor user) async {
    final data = await userAPI.callAPIEditInfor(user);
    notifyListeners();
    if (data.statusCode == 200) {
      return "Success";
    } else {
      return data.data["Edit fail"];
    }
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

//*******************************************Rate***************************************** */
  Future<dynamic> postNewEvalutes(Rate rate) async {
    final data = await RateAPI.callNewEvalute(rate);
    notifyListeners();
    if (data.statusCode == 200) {
      return "Success";
    } else {
      return "Fail";
    }
  }

  Future<List<dynamic>> getListReview(Dish dish) async {
    final data = await RateAPI.getListReview(dish);
    notifyListeners();
    return data;
  }

//****************************************bill**************************** */

  Future<dynamic> postNewBill(Bill bill) async {
    final data = await BillAPI.callAPINewBill(bill);
    notifyListeners();
    return data;
  }

  Future<List<dynamic>> getListBill() async {
    final data = await BillAPI.callAPIgetBill();

    notifyListeners();
    return data;
  }
}
