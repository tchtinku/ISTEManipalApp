import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:istemanipalapp/consts/urls.dart';

class BlogApi {
  final String url = BASE_BLOG_URL;
  var networkError = {
    'success': false,
    'error': "Network Error.",
    'message':
        "Some kind of network error occurred. Cannot send requests. Check your network and if the problem persists then probably the server isn't responding."
  };

  //for registering users
  Future<dynamic> fetchBlogs(page, size) async {
    //TODO: implement pagination later
    // final apiUrl = url + 'blogPosts?page=$page?&size=$size';
    final apiUrl = url + '/mobile/blogPosts';
    var response;
    try {
      response = await http.get(apiUrl);
    } catch (e) {
      return networkError;
    }

    if (response.statusCode == 200) {
      var blogData = {
        'success': true,
        'posts': json.decode(response.body),
      };
      return blogData;
    } else {
      return networkError;
    }
  }
}
