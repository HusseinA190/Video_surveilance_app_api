import 'package:flutter/material.dart';
import 'package:finalp/layout/home_layout.dart';
import 'package:finalp/moduls/login/login.dart';


class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String homeLayoutRoute = '/homeLayout';


}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(

        body: Center(

        ),
      ),
    );
  }
}
