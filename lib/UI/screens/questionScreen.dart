import 'package:flutter/material.dart';
import 'package:istemanipalapp/logic/models/Question.dart';
import 'package:istemanipalapp/logic/viewmodels/interviewViewModel.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:istemanipalapp/services/navigationService.dart';
import 'package:provider/provider.dart';
import '../../consts/routes.dart' as routes;

class QuestionScreen extends StatelessWidget {
  final Question question;
  const QuestionScreen({@required this.question});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<InterviewViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Question Details"),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Question',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(question.question),
            Text("Category: ${question.category}"),
            SizedBox(
              height: 20,
            ),
            Text(
              'About Mentor',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text("Name: ${question.mentor.name}"),
            Text("Year: ${question.mentor.year}"),
            Text("About: ${question.mentor.briefDescription}"),
            Text("Company: ${question.mentor.company}"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    viewModel.fetchLeaderboard(question.key);
                    locator<NavigationService>().navigateWithContext(
                        routes.LEADERBOARD, context,
                        arguments: question);
                  },
                  child: Text("Leader Board"),
                ),
                TextButton(
                  onPressed: () {
                    locator<NavigationService>().navigateWithContext(
                        routes.QUESTIONSUBMIT, context,
                        arguments: question);
                  },
                  child: Text("Submit Answer"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
