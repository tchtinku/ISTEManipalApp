import 'package:flutter/material.dart';
import 'package:istemanipalapp/logic/models/Question.dart';
import 'package:istemanipalapp/logic/viewmodels/interviewViewModel.dart';
import 'package:provider/provider.dart';

class QuestionSubmitScreen extends StatelessWidget {
  final Question question;
  final TextEditingController _answerController = TextEditingController();

  QuestionSubmitScreen({@required this.question});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<InterviewViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Question Submit"),
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
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _answerController,
              maxLines: 10,
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                print(_answerController.text);
                viewModel.submitAnswer(question.key, _answerController.text);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
