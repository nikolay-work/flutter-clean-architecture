import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  Future<void>? navigateTo(String routeName) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }
}