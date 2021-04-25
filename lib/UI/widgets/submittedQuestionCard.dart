import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:istemanipalapp/logic/models/Question.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:istemanipalapp/services/navigationService.dart';
import '../../consts/routes.dart' as routes;

class SubmittedQuestionCard extends StatelessWidget {
  final Question question;

  const SubmittedQuestionCard({
    Key key,
    @required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.blue,
        onTap: () {
          locator<NavigationService>()
              .navigateWithContext(routes.ANSWER, context, arguments: question);
        },
        child: Container(
          color: Theme.of(context).cardColor,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.0,
                    child: Text(
                      question.question,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    question.mentor.name,
                  ),
                  Text("Category: ${question.category}"),
                ],
              ),
            ],
          ),
        ));
  }
}
