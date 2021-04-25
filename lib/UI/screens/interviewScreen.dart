import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/widgets/QuestionCard.dart';
import 'package:istemanipalapp/UI/widgets/SpinnerWidget.dart';
import 'package:istemanipalapp/logic/viewmodels/interviewViewModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class InterviewScreen extends StatelessWidget {
  Widget renderBody(viewModel) {
    if (viewModel.isFetchingData) {
      return SpinnerWidget();
    } else {
      if (viewModel.questions.length == 0) {
        return Center(
          child: Column(
            children: [
              Text('Sorry no question to show currently.'),
              OutlinedButton(
                  child: Text('Try Again.'),
                  onPressed: () {
                    viewModel.fetchAllQuestions();
                  }),
            ],
          ),
        );
      } else {
        return ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: viewModel.questions.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.white,
              child: QuestionCard(
                question: viewModel.questions[index],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<InterviewViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Interview Questions"),
      ),
      body: renderBody(viewModel),
    );
  }
}
