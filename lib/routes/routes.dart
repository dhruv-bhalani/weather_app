import 'package:flutter/material.dart';
import 'package:weatherapp/screens/detailscreen/view/detail.dart';
import 'package:weatherapp/screens/homescreens/view/home.dart';
import 'package:weatherapp/screens/splashscreen/view/splash.dart';

class Routes {
  Map<String, Widget Function(BuildContext)> get allRoutes {
    return {
      '/': (context) => const Splash(),
      '/home': (context) => const Home(),
      '/search': (context) => const Detail(),
    };
  }
}
