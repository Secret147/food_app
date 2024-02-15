// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:foodapp/models/user.dart';
import 'package:foodapp/models/userInfor.dart';
import 'package:foodapp/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userAPI {
  static Future<dynamic> callAPICreateUser(User user) async {
    try {
      final dio = Dio();

      final response = await dio.post("$baseUrl/user/newuser",
          data: user.toJson(), options: Options(headers: Const.mainHeader));
      dynamic res = response.data;
      return res;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> callAPILogin(dynamic user) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        "$baseUrl/user/login",
        data: user,
      );
      dynamic res = response;
      return res;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> callAPIGetInfor() async {
    try {
      final dio = Dio();
      final SharedPreferences prefs = await Const.prefs;
      String? token = prefs.getString("token");
      final response = await dio.get("$baseUrl/user/infor",
          options: Options(headers: {
            "Content-type": 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          }));
      dynamic data = response.data;
      UserInfor user = UserInfor(
        id: data["id"],
        email: data["email"],
        image: data["image"],
        name: data["name"],
        address: data["address"] ?? "",
        birth: data["birth"] ?? "",
        description: data["description"] ?? "",
        phone: data["phone"] ?? "",
      );

      return user;
    } catch (e) {
      rethrow;
    }
  }
}
