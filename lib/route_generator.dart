import 'package:demo_app/screens/home_screen.dart';
import 'package:demo_app/screens/landing_page.dart';
import 'package:demo_app/screens/login.dart';
import 'package:demo_app/screens/profile.dart';
import 'package:demo_app/screens/register.dart';
import 'package:demo_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as dynamic;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/landing':
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const MyLogin());
      case '/register':
        return MaterialPageRoute(builder: (_) => const MyRegister());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const Profile());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
