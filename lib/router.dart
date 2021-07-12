import 'package:flutter/material.dart';
import 'package:weatherweather/screen.dart';
import 'package:weatherweather/defaultScreen.dart';

import 'package:weatherweather/screens/temp.dart';
class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => Screen(),
        );
      case '/temp':
        return MaterialPageRoute(
            settings: RouteSettings(name: settings.name),
            builder: (_) => Temp()
        );
      default:
        return MaterialPageRoute(builder: (context) => defaultScreen());
    }
  }
}