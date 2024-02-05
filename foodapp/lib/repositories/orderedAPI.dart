import 'package:dio/dio.dart';
import 'package:foodapp/models/ordered.dart';
import 'package:foodapp/models/responseordered.dart';
import 'package:foodapp/utils/const.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderedAPI {
  static Future<dynamic> addTocart(Ordered ordered) async {
    try {
      final dio = Dio();
      final SharedPreferences prefs = await Const.prefs;
      String? token = prefs.getString("token");
      final response = await dio.post("$baseUrl/cart/neworder",
          data: ordered.toJson(),
          options: Options(headers: {
            "Content-type": 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          }));
      dynamic data = response.data;
      return data;
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> callAPIgetOrdered() async {
    try {
      final dio = Dio();
      final SharedPreferences prefs = await Const.prefs;
      String? token = prefs.getString("token");
      final response = await dio.get("$baseUrl/cart/ordered",
          options: Options(headers: {
            "Content-type": 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          }));
      List<dynamic> datas = response.data;
      List<ResponseOrdered> ordereds =
          datas.map((data) => ResponseOrdered.fromMap(data)).toList();
      return ordereds;
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> callAPIaddQuantity(ResponseOrdered order) async {
    try {
      final dio = Dio();
      final SharedPreferences prefs = await Const.prefs;
      String? token = prefs.getString("token");
      final response = await dio.put("$baseUrl/cart/add/quantity",
          data: order.toJson(),
          options: Options(headers: {
            "Content-type": 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          }));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> callAPIremoveQuantity(ResponseOrdered order) async {
    try {
      final dio = Dio();
      final SharedPreferences prefs = await Const.prefs;
      String? token = prefs.getString("token");
      final response = await dio.put("$baseUrl/cart/remove/quantity",
          data: order.toJson(),
          options: Options(headers: {
            "Content-type": 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          }));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> callAPIdeleteOrdered(dynamic id) async {
    try {
      final dio = Dio();
      final SharedPreferences prefs = await Const.prefs;
      String? token = prefs.getString("token");
      final response = await dio.delete("$baseUrl/cart/$id",
          options: Options(headers: {
            "Content-type": 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          }));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
