// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:foodapp/models/user.dart';
import 'package:foodapp/utils/const.dart';

class userAPI {
  static Future<dynamic> callAPICreateUser(User user) async {
    try {
      final dio = Dio();

      final response = await dio.post("$baseUrl/user/newuser",
          data: user.toJson(), options: Options(headers: mainHeader));
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
      dynamic res = response.data;
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
