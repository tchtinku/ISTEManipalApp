import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/screens/LoginScreen.dart';
import 'package:istemanipalapp/logic/viewmodels/authViewModel.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:istemanipalapp/services/navigationService.dart';
import 'package:istemanipalapp/services/themeManager.dart';
import 'package:provider/provider.dart';
import '../../consts/routes.dart' as routes;

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<AuthViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      backgroundColor: Colors.white,
      body: (model.status == Status.Authenticated)
          ? Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(model.user.firstName),
                  Text("username: ${model.user.username}"),
                  Text("token: ${model.token}"),
                  FlatButton(
                    onPressed: () {
                      locator<ThemeManager>().toggleLightAndDark();
                    },
                    child: Text("Change Theme"),
                  ),
                  FlatButton(
                    onPressed: () {
                      model.logOut();
                    },
                    child: Text("Logout"),
                  ),
                  FlatButton(
                    onPressed: () {
                      locator<NavigationService>().navigateTo(routes.login);
                    },
                    child: Text("new screen"),
                  ),
                ],
              ),
            )
          : LoginScreen(),
    );
  }
}
