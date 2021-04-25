import 'Mentor.dart';

class Question {
  int key;
  Mentor mentor;
  String question;
  String category;
  String expectedAnswer;
  String userAnswer;
  String userPoints;
  Question(this.key, this.mentor, this.question, this.category,
      this.expectedAnswer, this.userAnswer, this.userPoints);

  Question.fromJson(Map<dynamic, dynamic> json)
      : key = json['pk'],
        mentor = Mentor.fromJson(json['mentor']),
        question = json['question'],
        category = json['category'],
        expectedAnswer = json['expected_answer'],
        userAnswer = json['userAnswer'],
        userPoints = json['userPoints'];
}
