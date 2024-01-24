import 'package:flutter/cupertino.dart';
import 'package:foodapp/utils/dimensions.dart';

class TestProvider extends ChangeNotifier {
  void changeMode() {
    Dimensions.darkmode = !Dimensions.darkmode;
    notifyListeners();
  }
}
