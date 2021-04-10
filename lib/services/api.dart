import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  final String baseUrl = "https://test.istemanipal.com/";
  var networkError = {
    'success': false,
    'error': "Network Error.",
    'message':
        "Some kind of network error occurred. Cannot send requests. Check your network and if the problem persists then probably the server isn't responding."
  };

  //for registering users
  Future<dynamic> registerUser(
      username, email, firstName, lastName, password, password2) async {
    final apiUrl = baseUrl + 'api/register';
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
      print(response.body);
      var error = {
        'success': false,
        'error': json.decode(response.body)['errors'],
      };
      return error;
    }
  }

  //for login user
  Future<dynamic> loginUser(username, password) async {
    final apiUrl = baseUrl + 'api/login';
    var response, responseStatus;
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
      print(response.body);
      var error = {
        'success': false,
        'error': "Your username or password is incorrect. Could not login.",
      };
      return error;
    }
  }

  Future<dynamic> fetchCategories() async {
    final url = baseUrl + "api/category";

    try {
      http.Response resp = await http.get(url);

      Map mappedResponse = jsonDecode(resp.body);
      return mappedResponse;
    } catch (e) {
      return networkError;
    }
  }
}
