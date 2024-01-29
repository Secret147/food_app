import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String baseUrl = "http://localhost:8080";

class Const {
  static String token = "mytoken";
  static const storage = FlutterSecureStorage();
  static Map<String, String> mainHeader = {
    "Content-type": 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
  };
}
