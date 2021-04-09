import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/screens/UserScreen.dart';
import 'package:istemanipalapp/UI/screens/blogScreen.dart';
import 'package:istemanipalapp/routingGenerator.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:istemanipalapp/services/navigationService.dart';
import 'package:provider/provider.dart';
import './services/themeManager.dart';
import './consts/routes.dart' as routes;
import 'logic/viewmodels/authViewModel.dart';
import 'logic/viewmodels/blogViewModel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<ThemeData>(
            create: (context) => locator<ThemeManager>().theme),
        ChangeNotifierProvider.value(
          value: locator<AuthViewModel>(),
        ),
        ChangeNotifierProvider.value(
          value: locator<BlogViewModel>(),
        ),
      ],
      child: Consumer<ThemeData>(
        builder: (context, theme, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: theme,
          navigatorKey: locator<NavigationService>().navigatorKey,
          initialRoute: routes.home,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}

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
              icon: Icon(CupertinoIcons.person), label: "User Info")
        ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: BlogScreen());
              });
              break;
            case 1:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: UserScreen());
              });
              break;
            default:
              return const CupertinoTabView();
          }
        });
  }
}
