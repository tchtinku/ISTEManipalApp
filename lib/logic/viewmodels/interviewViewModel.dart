import 'package:flutter/cupertino.dart';
import 'package:istemanipalapp/logic/models/LeaderboardUser.dart';
import 'package:istemanipalapp/logic/models/Question.dart';
import 'package:istemanipalapp/logic/viewmodels/authViewModel.dart';
import 'package:istemanipalapp/services/dialogService.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:istemanipalapp/services/api.dart';

class InterviewViewModel with ChangeNotifier {
  InterviewViewModel();
  //making instace of web api and storage services to use their function
  var _api = locator<Api>();
  String _headers;

  List<Question> _questions = [];
  List<Question> _submittedQuestions = [];
  List<LeaderboardUser> _leaderboardUsers = [];
  bool _isFetchingData = false;

  //getters
  List<Question> get questions => _questions;
  List<Question> get submittedQuestions => _submittedQuestions;
  List<LeaderboardUser> get leaderboardUsers => _leaderboardUsers;
  bool get isFetchingData => _isFetchingData;

  //setters
  _setFetchingData(value) {
    _isFetchingData = value;
    notifyListeners();
  }

  //gets the headers from authviewmodel singleton object
  _getHeaders() {
    _headers = locator<AuthViewModel>().headers;
  }

  _waitForHeadersAndFetchQuestions() async {
    _setFetchingData(true);
    await locator<AuthViewModel>().getTokenAndUser();
    _setFetchingData(false);

    fetchAllQuestions();
  }

  _setQuestions(value) {
    _questions = [];
    for (int i = 0; i < value.length; i++) {
      _questions.add(Question.fromJson(value[i]));
    }
    notifyListeners();
  }

  _setSubmittedQuestions(value) {
    _submittedQuestions = [];
    double userPoints = 0;
    for (int i = 0; i < value.length; i++) {
      Question ques = Question.fromJson(value[i]['question']);
      ques.userAnswer = value[i]['answer'];
      ques.userPoints =
          (value[i]['points'] == null) ? '0' : value[i]['points'].toString();

      userPoints += double.parse(ques.userPoints);
      _submittedQuestions.add(ques);
    }

    locator<AuthViewModel>().setUserPoints(userPoints);
    notifyListeners();
  }

  _setLeaderboardUsers(value) {
    _leaderboardUsers = [];
    print(value);
    for (int i = 0; i < value.length; i++) {
      _leaderboardUsers.add(LeaderboardUser.fromJson(value[i]));
    }
    notifyListeners();
  }

  InterviewViewModel.initialize() {
    _waitForHeadersAndFetchQuestions();
  }

  void fetchAllQuestions() async {
    _getHeaders();
    _setFetchingData(true);
    var questionData = await _api.fetchQuestions(_headers);
    if (questionData['success'] == true) {
      _setQuestions(questionData['questions']);
      _setFetchingData(false);
    } else {
      locator<DialogService>()
          .showAlertDialog(questionData['error'], questionData['message']);
      _setFetchingData(false);
    }
  }

  void fetchSubmittedQuestions() async {
    _getHeaders();
    _setFetchingData(true);
    var submittedQuestionData = await _api.fetchSubmittedQuestions(_headers);
    if (submittedQuestionData['success'] == true) {
      _setSubmittedQuestions(submittedQuestionData['answers']);
      _setFetchingData(false);
    } else {
      locator<DialogService>().showAlertDialog(
          submittedQuestionData['error'], submittedQuestionData['message']);
      _setFetchingData(false);
    }
  }

  void submitAnswer(int questionKey, String answer) async {
    if (answer == '' || answer == null || answer.length == 0) {
      locator<DialogService>().showAlertDialog("Enter Answer",
          "The answer field cannot be empty. Please enter a valid answer to evaluate.");
      return;
    }
    _getHeaders();

    _setFetchingData(true);
    var submitData = await _api.submitAnswer(_headers, answer, questionKey);
    _setFetchingData(false);

    if (submitData['success'] == true) {
      locator<DialogService>()
          .showAlertDialog('Submitted', submitData['message']);
    } else {
      locator<DialogService>()
          .showAlertDialog(submitData['error'], submitData['message']);
    }
  }

  void fetchLeaderboard(int questionKey) async {
    _setFetchingData(true);
    var leaderboardData = await _api.fetchLeaderboard(questionKey);
    if (leaderboardData['success'] == true) {
      _setLeaderboardUsers(leaderboardData['leaderboard']);
    } else {
      locator<DialogService>().showAlertDialog(
          leaderboardData['error'], leaderboardData['message']);
    }
    _setFetchingData(false);
  }
}
