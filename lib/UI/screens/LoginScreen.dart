import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/screens/UserScreen.dart';
import 'package:istemanipalapp/UI/widgets/SpinnerWidget.dart';
import 'package:istemanipalapp/logic/viewmodels/authViewModel.dart';
import 'package:istemanipalapp/services/dialogService.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:istemanipalapp/services/navigationService.dart';
import 'package:provider/provider.dart';
import '../../consts/routes.dart' as routes;

class LoginScreen extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<AuthViewModel>(context, listen: true);
    if (viewModel.status == Status.Unauthenticated) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 100,
                      height: 100,
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 40),
                      )),
                ),
              ),
              (viewModel.status == Status.Authenticated)
                  ? Text('logged in')
                  : Text('Logged out'), // TODO: remove later,
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter username'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              !viewModel.isFetchingData
                  ? Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {
                          viewModel.login(_usernameController.text,
                              _passwordController.text);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    )
                  : SpinnerWidget(),
              SizedBox(
                height: 130,
              ),
              TextButton(
                onPressed: () {
                  locator<DialogService>().showAlertDialog('Error',
                      'Register not implemented yet,but dialog working');
                },
                child: Text(
                  'New user? Register here.',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ), //TODO: Not visible on screen
            ],
          ),
        ),
      );
    }
    return UserScreen();
  }
}
