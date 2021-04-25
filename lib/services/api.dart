import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:istemanipalapp/consts/urls.dart';

class Api {
  final String baseUrl = BASE_URL;

  //Errors
  var networkError = {
    'success': false,
    'error': "Network Error.",
    'message':
        "Some kind of network error occurred. Cannot send requests. Check your network and if the problem persists then probably the server isn't responding."
  };

  var authError = {
    'success': false,
    'error': 'User not logged in.',
    'message':
        "User not logged in. Please login and try again. Remember that this feature is for members only. If you're not a member yet you need to register first.",
  };

  //Http calls
  //for registering users
  Future<dynamic> registerUser(
      username, email, firstName, lastName, password, password2) async {
    final apiUrl = baseUrl + '/api/register';
    var response, responseStatus;
    try {
      response = await http.post(apiUrl, body: {
        'username': username,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'password': password,
        'password2': password2
      });
      responseStatus = json.decode(response.body)['status'];
    } catch (e) {
      return networkError;
    }

    if (response.statusCode == 200 && responseStatus == "successful") {
      var userData = {
        'success': true,
        'user': json.decode(response.body)['details'],
      };
      return userData;
    } else {
      var error = {
        'success': false,
        'error': json.decode(response.body)['errors'],
      };
      return error;
    }
  }

  //for login user
  Future<dynamic> loginUser(username, password) async {
    final apiUrl = baseUrl + '/api/login';
    var response, responseStatus;
    if (username.length == 0 || password.length == 0) {
      return {'success': false, 'error': 'Enter both username and password'};
    }
    try {
      response = await http.post(apiUrl, body: {
        'username': username,
        'password': password,
      });
      responseStatus = json.decode(response.body)['status'];
    } catch (e) {
      return networkError;
    }
    if (response.statusCode == 200 && responseStatus == "successful") {
      var userData = {
        'success': true,
        'user': {
          'token': json.decode(response.body)['token'],
          'username': json.decode(response.body)['username'],
          'email': json.decode(response.body)['email'],
          'first_name': json.decode(response.body)['first_name'],
          'last_name': json.decode(response.body)['last_name'],
        },
      };
      return userData;
    } else {
      var error = {
        'success': false,
        'error': "Your username or password is incorrect. Could not login.",
      };
      return error;
    }
  }

  //To fetch all categories
  Future<dynamic> fetchCategories() async {
    final url = baseUrl + "/api/category";

    http.Response resp;
    try {
      resp = await http.get(url);
    } catch (e) {
      return networkError;
    }

    Map mappedResponse = jsonDecode(resp.body);
    var categoryData = {
      'success': true,
      'categories': mappedResponse['active']
    };
    return categoryData;
  }

  //To fetch all questions
  Future<dynamic> fetchQuestions(headers) async {
    final url = baseUrl + "/api/interview/questions";
    http.Response resp;
    try {
      resp = await http.get(url, headers: {'Authorization': headers});
    } catch (e) {
      return networkError;
    }

    Map mappedResponse = jsonDecode(resp.body);
    if (mappedResponse['detail'] != null) {
      print('Auth error');
      return authError;
    }

    print('successful');
    var questionData = {
      'success': true,
      'questions': mappedResponse['questions'],
    };
    return questionData;
  }

  //To submit answer to a question
  Future<dynamic> submitAnswer(headers, answer, questionKey) async {
    final url = baseUrl + "/api/interview/submit";
    http.Response resp;
    try {
      resp = await http.post(url, body: {
        'answer': answer.toString(),
        'pk': questionKey.toString(),
      }, headers: {
        'Authorization': headers
      });
    } catch (e) {
      print(e);
      return networkError;
    }

    Map mappedResponse = jsonDecode(resp.body);
    if (mappedResponse['detail'] != null) {
      print('Auth error');
      return authError;
    }

    if (mappedResponse['status'] == 'unsuccessful') {
      var error = {
        'success': false,
        'error': mappedResponse['errors'],
        'message':
            "Some error occurred while submitting the response. Note that you cannot submit answer to the same question twice.",
      };
      return error;
    }

    print('successful');
    var submitData = {
      'success': true,
      'message': "Thank you! Your response was submitted succesfully.",
    };
    return submitData;
  }

  //To get leaderboard of a question
  Future<dynamic> fetchLeaderboard(questionKey) async {
    final url = baseUrl + "/api/interview/leaderboard/$questionKey";
    http.Response resp;
    try {
      resp = await http.get(url);
    } catch (e) {
      return networkError;
    }

    Map mappedResponse = jsonDecode(resp.body);
    var leaderboardData = {
      'success': true,
      'leaderboard': mappedResponse['leaderboard'],
    };
    return leaderboardData;
  }
}
