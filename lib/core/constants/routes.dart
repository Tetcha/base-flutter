import 'package:flutter/cupertino.dart';
import 'package:schedule_app_fe/screens/login.dart';

class IRoute {
  final String path;
  final Widget widget;
  IRoute({required this.path, required this.widget});
}

class RoutePath {
  // general
  static const String home = '/home';

  // auth
  static const String login = '/login';
  static const String register = '/register';

  // bottom nav bar
  static const String schedule = '/schedule';
  static const String money = '/money';
  static const String profile = '/profile';
  static const String setting = '/setting';
}

List<IRoute> routes = [
  IRoute(path: RoutePath.home, widget: const LoginScreen()),
  // auth
  IRoute(path: RoutePath.login, widget: const LoginScreen()),
  IRoute(path: RoutePath.register, widget: const LoginScreen()),
  // main func screen
];
