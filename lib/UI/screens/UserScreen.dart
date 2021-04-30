import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/screens/LoginScreen.dart';
import 'package:istemanipalapp/logic/viewmodels/authViewModel.dart';
import 'package:istemanipalapp/logic/viewmodels/interviewViewModel.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:istemanipalapp/services/navigationService.dart';
import '../../consts/routes.dart' as routes;
import 'package:istemanipalapp/services/themeManager.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<AuthViewModel>(context, listen: true);
    var interviewViewModel =
        Provider.of<InterviewViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: (viewModel.status == Status.Authenticated)
          ? Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(viewModel.user.firstName),
                  Text("username: ${viewModel.user.username}"),
                  Text("token: ${viewModel.token}"),
                  TextButton(
                    onPressed: () {
                      locator<ThemeManager>().toggleLightAndDark();
                    },
                    child: Text("Change Theme"),
                  ),
                  TextButton(
                    onPressed: () {
                      interviewViewModel.fetchSubmittedQuestions();
                      locator<NavigationService>().navigateWithContext(
                          routes.SUBMITTEDQUESTIONS, context);
                    },
                    child: Text("Submitted Answers"),
                  ),
                  TextButton(
                    onPressed: () {
                      viewModel.logOut();
                    },
                    child: Text("Logout"),
                  ),
                  Text(
                    'Points: ${viewModel.user.points.toString()}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : LoginScreen(),
    );
  }
}
