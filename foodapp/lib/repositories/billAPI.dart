import 'package:dio/dio.dart';
import 'package:foodapp/models/bill.dart';
import 'package:foodapp/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillAPI {
  static Future<dynamic> callAPINewBill(Bill bill) async {
    final dio = Dio();
    final SharedPreferences prefs = await Const.prefs;
    String? token = prefs.getString("token");

    final response = await dio.post("$baseUrl/bill/newbill",
        data: bill.toJson(),
        options: Options(headers: {
          "Content-type": 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        }));
    return response.data;
  }

  static Future<dynamic> callAPIgetBill() async {
    try {
      final dio = Dio();
      final SharedPreferences prefs = await Const.prefs;
      String? token = prefs.getString("token");
      final response = await dio.get("$baseUrl/bill/listbill",
          options: Options(headers: {
            "Content-type": 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          }));
      List<dynamic> datas = response.data;
      List<Bill> bills = datas.map((data) => Bill.fromMap(data)).toList();
      return bills;
    } catch (e) {
      print(e);
    }
  }
}
