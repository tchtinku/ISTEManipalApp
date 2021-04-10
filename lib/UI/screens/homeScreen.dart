import 'package:flutter/cupertino.dart';
import 'package:istemanipalapp/UI/screens/LoginScreen.dart';
import 'package:istemanipalapp/UI/screens/blogScreen.dart';
import 'package:istemanipalapp/UI/screens/categoryScreen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.calendar), label: "Events"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: "User Info"),
        ]),
        tabBuilder: (context, index) {
          List<Widget> _widgetList = [
            BlogScreen(),
            CategoryScreen(),
            LoginScreen()
          ];
          return CupertinoTabView(builder: (context) {
            return CupertinoPageScaffold(child: _widgetList[index]);
          });
        });
  }
}
