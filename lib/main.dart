import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:istemanipalapp/routingGenerator.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:istemanipalapp/services/navigationService.dart';
import 'package:provider/provider.dart';
import './services/themeManager.dart';
import './consts/routes.dart' as routes;
import 'logic/viewmodels/authViewModel.dart';

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
      ],
      child: Consumer<ThemeData>(
        builder: (context, theme, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: theme,
          navigatorKey: locator<NavigationService>().navigatorKey,
          initialRoute: routes.HOME,
          // routes: {
          //   routes.HOME: (_) => Home(),
          //   routes.EVENTS: (_) => EventScreen(),
          //   routes.LOGIN: (_) => LoginScreen(),
          //   routes.BLOG: (_) => BlogScreen(),
          // },
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
