// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';

import '../../ui/pages/detail/detail.dart';
import '../../ui/pages/filter/filter.dart';
import '../../ui/pages/main/main.dart';
import '../../ui/pages/meal/meal.dart';

class FCRouter {
  static const String initialRoute = FCMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    FCMainScreen.routeName: (ctx) => FCMainScreen(),
    FCMealScreen.routeName: (ctx) => FCMealScreen(),
    FCMealDetailScreen.routeName:(ctx) => FCMealDetailScreen(),
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == FCFilterScreen.routeName) {
      return MaterialPageRoute(
        builder: (ctx) {
          return FCFilterScreen();
        },
        fullscreenDialog: true
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}