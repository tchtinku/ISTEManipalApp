import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/screens/WelcomeScreen.dart';
import 'package:istemanipalapp/UI/screens/blogScreen.dart';
import 'package:istemanipalapp/UI/screens/LoginScreen.dart';
import 'package:istemanipalapp/UI/screens/eventsScreeen.dart';
import 'package:istemanipalapp/UI/screens/homeScreen.dart';
import 'package:istemanipalapp/UI/screens/webViewScreen.dart';
import './consts/routes.dart' as routes;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    Map args = settings.arguments;
    Map ROUTES = {
      routes.WELCOME: MaterialPageRoute(builder: (_)=>WelcomeScreen()),
      routes.HOME: MaterialPageRoute(builder: (_) => Home()),
      routes.BLOG: MaterialPageRoute(
        builder: (_) => BlogScreen(),
      ),
      routes.LOGIN: MaterialPageRoute(builder: (_) => LoginScreen()),
      routes.EVENTS: MaterialPageRoute(
        builder: (_) => EventScreen(
            categoryName: args['category_name'], events: args['events']),
      ),
      routes.WEBVIEW: MaterialPageRoute(
        builder: (_) => WebViewScreen(url: args['url']),
      )
    };

    return ROUTES[settings.name] != null
        ? ROUTES[settings.name]
        : _errorRoute();
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
