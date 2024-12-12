import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool ischeckWeathwer = true;

  void checkWeather() {
    ischeckWeathwer = !ischeckWeathwer;
    notifyListeners();
  }
}
