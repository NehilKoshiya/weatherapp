import 'package:flutter/material.dart';
import 'package:interviewapp/routes/route_path.dart';
import 'package:interviewapp/view/home_screen.dart';
import 'package:interviewapp/view/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutePath.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: Text('Error')),
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
