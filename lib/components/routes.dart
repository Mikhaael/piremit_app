import 'package:flutter/material.dart';
import 'package:piremit_app/screen/login_screen.dart';
import 'package:piremit_app/screen/register_screen.dart';
import 'package:piremit_app/screen/splash_screen.dart';
import 'package:piremit_app/screen/welcome_screen.dart';


class Routes {
  Routes._();

  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String register = '/register';
  static const String login = '/login';

  static Map<String, Widget Function(BuildContext)> routes = {
    splash: (context) => const SplashScreen(),
    welcome: (context) => const WelcomeScreen(),
    register: (context) => const RegisterScreen(),
    login: (context) => const LoginScreen(),
  };
}