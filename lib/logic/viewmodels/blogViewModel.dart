import 'package:flutter/cupertino.dart';
import 'package:istemanipalapp/logic/models/Blog.dart';
import 'package:istemanipalapp/services/dialogService.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:istemanipalapp/services/blogApi.dart';
import 'package:istemanipalapp/services/navigationService.dart';
import '../../consts/routes.dart' as routes;

class BlogViewModel with ChangeNotifier {
  BlogViewModel();
  //making instace of web api and storage services to use their function
  var blogApi = locator<BlogApi>();

  List<Blog> _blogs = [];
  bool _isFetchingData = false;
  int _pageNum = 1;
  int _size = 20;

  //getters
  List<Blog> get blogs => _blogs;
  bool get isFetchingData => _isFetchingData;
  int get pageNum => _pageNum;
  int get size => _size;

  //setters
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
      locator<DialogService>().showAlertDialog('Error', blogData['message']);
      _setFetchingData(false);
    }
  }

  void launchUrl(url) async {
    // await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
    locator<NavigationService>()
        .navigateTo(routes.WEBVIEW, arguments: {'url': url});
  }
}
