import 'package:flutter/material.dart';
import '../../core/exceptions/route_exception.dart';
import '../export.dart';

class AppRouter {
  static const String auth = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';


  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
       case auth:
        return MaterialPageRoute(
          builder: (_) => AuthScreen(),
        );
      case splash:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(
          ),
        );
      case register:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        ); 
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );  
      default:
        throw const RouteException('Route not found!');
    }
  }
}