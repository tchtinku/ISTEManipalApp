import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/screens/LoginScreen.dart';
import 'package:istemanipalapp/UI/screens/blogScreen.dart';
import 'package:istemanipalapp/UI/screens/categoryScreen.dart';
import 'package:istemanipalapp/UI/screens/interviewScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      BlogScreen(),
      InterviewScreen(),
      CategoryScreen(),
      LoginScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.doc),
        title: ("_____"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.square_grid_4x3_fill),
        //ImageIcon(AssetImage("assets/Icons/medal.png"),size: 100,),
        title: ("_____"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.airplay_outlined),
        title: ("_____"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("_____"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor:Colors.black87,

      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style13, // Choose the nav bar style with this property.
    );
  }
}
