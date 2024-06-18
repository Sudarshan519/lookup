import 'package:flutter/material.dart';
import 'package:lookup/ui/auth/login_screen.dart';
import 'package:lookup/ui/detail/detail_screen.dart';
import 'package:lookup/ui/home/home_screen.dart';
import 'package:lookup/ui/auth/login_screen.dart';
import 'package:lookup/ui/auth/signup_screen.dart';

import '../../ui/splash/splash_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/detail':
        var args = settings.arguments as Map<String, dynamic>?;
        String? image = args?['image'];
        String? tag = args?['tag'];
        return MaterialPageRoute(
            builder: (_) => DetailScreen(
                  image: image ?? '',
                  tag: tag ?? '',
                ));
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
