import 'package:foodapp/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static updateHeader(String token) {
    Const.mainHeader = {
      "Content-type": 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
}
