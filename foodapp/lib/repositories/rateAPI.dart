import 'package:dio/dio.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/models/rate.dart';
import 'package:foodapp/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RateAPI {
  Future<dynamic> callNewEvalute(Rate rate) async {
    try {
      final dio = Dio();
      final SharedPreferences prefs = await Const.prefs;
      String? token = prefs.getString("token");
      final response = await dio.post("$baseUrl/rate/newevalute",
          data: rate.toJson(),
          options: Options(headers: {
            "Content-type": 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          }));

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
