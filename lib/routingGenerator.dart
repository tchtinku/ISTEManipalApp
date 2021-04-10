import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/screens/blogScreen.dart';
import 'package:istemanipalapp/UI/screens/LoginScreen.dart';
import 'package:istemanipalapp/UI/screens/categoryScreen.dart';
import 'package:istemanipalapp/UI/screens/homeScreen.dart';
import 'package:istemanipalapp/UI/screens/webViewScreen.dart';
import './consts/routes.dart' as routes;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case routes.HOME:
        return MaterialPageRoute(builder: (_) => Home());
      case routes.BLOG:
        return MaterialPageRoute(
          builder: (_) => BlogScreen(),
        );

      case routes.LOGIN:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );

      case routes.EVENTS:
        return MaterialPageRoute(
          builder: (_) => CategoryScreen(),
        );

      case routes.WEBVIEW:
        return MaterialPageRoute(
          builder: (_) => WebViewScreen(url: args),
        );

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
