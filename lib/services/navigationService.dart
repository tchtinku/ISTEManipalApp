import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/screens/LoginScreen.dart';
import 'package:istemanipalapp/UI/screens/UserScreen.dart';
import 'package:istemanipalapp/UI/screens/blogScreen.dart';
import 'package:istemanipalapp/UI/screens/categoryScreen.dart';
import 'package:istemanipalapp/UI/screens/eventsScreeen.dart';
import 'package:istemanipalapp/UI/screens/homeScreen.dart';
import 'package:istemanipalapp/UI/screens/webViewScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../consts/routes.dart' as routes;

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Widget _screenBuilder(name, args) {
    if (name == routes.BLOG) {
      return BlogScreen();
    } else if (name == routes.LOGIN) {
      return LoginScreen();
    } else if (name == routes.EVENTS) {
      return EventScreen(
          categoryName: args['category_name'], events: args['events']);
    } else if (name == routes.WEBVIEW) {
      return WebViewScreen(url: args['url']);
    } else if (name == routes.USER) {
      return UserScreen();
    } else if (name == routes.CATEOGRY) {
      return CategoryScreen();
    } else {
      return Home();
    }
    // else if (name == routes.ANSWERSUBMIT) {
    //   return
    // }
    // else if (name == routes.INTERVIEWQUESTIONS) {
    //   return WebViewScreen(url: args['url']);
    // }
    // else if (name == routes.REGISTER) {
    //   return WebViewScreen(url: args['url']);
    // }
  }

  void navigateWithContext(String routeName, BuildContext context,
      {dynamic arguments}) {
    pushNewScreen(
      context,
      screen: _screenBuilder(routeName, arguments),
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  void navigateWithoutContext(String routeName, {dynamic arguments}) {
    Navigator.pushNamed(navigatorKey.currentContext, routeName,
        arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}
