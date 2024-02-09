import 'package:dio/dio.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/utils/const.dart';

class dishAPI {
  static Future<dynamic> getDishPopular() async {
    try {
      final dio = Dio();
      final response = await dio.get("$baseUrl/dish/popular");
      List<dynamic> datas = response.data;
      List<Dish> dishs = datas.map((data) => Dish.fromMap(data)).toList();
      return dishs;
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> getDishByType(dynamic type) async {
    try {
      final dio = Dio();
      final response = await dio.get("$baseUrl/dish/type/$type");
      List<dynamic> datas = response.data;
      List<Dish> dishs = datas.map((data) => Dish.fromMap(data)).toList();
      return dishs;
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> getDishDetail(dynamic id) async {
    try {
      final dio = Dio();
      final response = await dio.get("$baseUrl/dish/detail/$id");
      dynamic data = response.data;
      Dish dish = Dish.fromMap(data);
      return dish;
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> addTocart(dynamic dishs) async {
    try {
      final dio = Dio();
      final response = await dio.post("$baseUrl/dish/neworder", data: dishs);
      dynamic data = response.data;

      return data;
    } catch (e) {
      print(e);
    }
  }
}
