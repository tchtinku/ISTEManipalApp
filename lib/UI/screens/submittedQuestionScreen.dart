import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/widgets/SpinnerWidget.dart';
import 'package:istemanipalapp/UI/widgets/submittedQuestionCard.dart';
import 'package:istemanipalapp/logic/viewmodels/interviewViewModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class SubmittedQuestionScreen extends StatelessWidget {
  Widget renderBody(viewModel) {
    if (viewModel.isFetchingData) {
      return SpinnerWidget();
    } else {
      if (viewModel.submittedQuestions.length == 0) {
        return Center(
          child: Column(
            children: [
              Text("You haven't solved any questions yet."),
            ],
          ),
        );
      } else {
        return ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: viewModel.submittedQuestions.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.white,
              child: SubmittedQuestionCard(
                question: viewModel.submittedQuestions[index],
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
        title: Text("Submitted Questions"),
      ),
      body: renderBody(viewModel),
    );
  }
}
