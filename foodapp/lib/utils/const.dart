import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = "http://localhost:8080";

class Const {
  static String? token = "mytoken";
  static const storage = FlutterSecureStorage();

  static final Future<SharedPreferences> prefs =
      SharedPreferences.getInstance();
  Future<void> format() async {
    final SharedPreferences prefs = await Const.prefs;
    token = prefs.getString("token");
  }

  static Map<String, String> mainHeader = {
    "Content-type": 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
  };
}
