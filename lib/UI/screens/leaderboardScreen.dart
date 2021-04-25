import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/widgets/SpinnerWidget.dart';
import 'package:istemanipalapp/logic/models/Question.dart';
import 'package:istemanipalapp/logic/viewmodels/interviewViewModel.dart';
import 'package:provider/provider.dart';

class LeaderboardScreen extends StatelessWidget {
  final Question question;

  LeaderboardScreen({@required this.question});

  Widget _renderList(viewModel) {
    if (viewModel.isFetchingData) {
      return SpinnerWidget();
    } else if (viewModel.leaderboardUsers.length == 0) {
      return Center(
        child: Text('There are no submissions for this question.'),
      );
    } else {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: viewModel.leaderboardUsers.length,
        itemBuilder: (context, index) {
          return Text(
              'Username: ${viewModel.leaderboardUsers[index].username}  Points: ${viewModel.leaderboardUsers[index].points}');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<InterviewViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Leaderboard"),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Text(
              'Question',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(question.question),
            SizedBox(
              height: 20,
            ),
            _renderList(viewModel),
          ],
        ),
      ),
    );
  }
}
