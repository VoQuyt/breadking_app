import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navigation {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static NavigatorState get stateRoot => navigatorKey.currentState!;
  static BuildContext get rootContext => navigatorKey.currentContext!;
  static Size get size => MediaQuery.of(rootContext).size;

  static readContext<VM>() => rootContext.read<VM>();
  static watchContext<VM>() => rootContext.watch<VM>();
  static selectContext<VM>() => rootContext.select((VM vm) => vm);

  static Future<dynamic> goto(Widget component) {
    return Navigator.of(rootContext)
        .push(MaterialPageRoute(builder: (context) => component));
  }

  static Future<dynamic> pushReplacement(Widget component,
      {Object? arguments}) {
    return navigatorKey.currentState!.pushReplacement(MaterialPageRoute(
        builder: (_) => component,
        settings: RouteSettings(arguments: arguments)));
  }

  static Future<dynamic> backUntilTo(Widget component,
      {Object? arguments}) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (_) => component,
            settings: RouteSettings(arguments: arguments)),
        (route) => false);
  }

  static void back() {
    navigatorKey.currentState!.pop();
  }
}
