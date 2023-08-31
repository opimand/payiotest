import 'package:flutter/material.dart';
import 'package:casino_test/presentation/pages/character.dart';

abstract class Routes {
  static String home = "/";
}

abstract class AppRoute {
  static String initial = Routes.home;

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.home: (context) => const CharacterPage(),
  };
}
