import 'package:flutter/cupertino.dart';
import 'package:istemanipalapp/logic/models/Blog.dart';
import 'package:istemanipalapp/logic/viewmodels/authviewmodel.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:istemanipalapp/services/blogApi.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogViewModel with ChangeNotifier {
  BlogViewModel();
  //making instace of web api and storage services to use their function
  var blogApi = locator<BlogApi>();

  List<Blog> _blogs = List<Blog>();
  bool _isFetchingData = false;
  String _errorMessage;
  int _pageNum = 1;
  int _size = 20;

  //getters
  List<Blog> get blogs => _blogs;
  bool get isFetchingData => _isFetchingData;
  String get errorMessage => _errorMessage;
  int get pageNum => _pageNum;
  int get size => _size;

  //setters

  _setErrorMessage(value) {
    _errorMessage = value;
    notifyListeners();
  }

  _setFetchingData(value) {
    _isFetchingData = value;
    notifyListeners();
  }

  _setBlogs(value) {
    for (int i = 0; i < value.length; i++) {
      _blogs.add(Blog.fromJson(value[i]));
    }
    notifyListeners();
  }

  BlogViewModel.initialize() {
    fetchAllBlogs();
  }

  void increasePageNum() {
    _pageNum++;
  }

  void fetchAllBlogs() async {
    _setFetchingData(true);
    var blogData = await blogApi.fetchBlogs(_pageNum, _size);
    if (blogData['success'] == true) {
      _setBlogs(blogData['posts']);
      _setFetchingData(false);
    } else {
      _setErrorMessage(blogData['error']);
      _setFetchingData(false);
    }
  }

  void launchUrl(url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }
}
