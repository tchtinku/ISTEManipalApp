import 'package:flutter/cupertino.dart';
import 'package:istemanipalapp/logic/models/Category.dart';
import 'package:istemanipalapp/services/dialogService.dart';

import 'package:istemanipalapp/services/locator.dart';

import '../../services/api.dart';
import '../../services/locator.dart';

class CategoryViewModel with ChangeNotifier {
  //making instace of web api and storage services to use their function
  var api = locator<Api>();

  List<Category> _categories = [];
  bool _isFetchingData = false;

  //getters
  List<Category> get categories => _categories;
  bool get isFetchingData => _isFetchingData;

  //setters
  _setFetchingData(value) {
    _isFetchingData = value;
    notifyListeners();
  }

  CategoryViewModel.initialize() {
    fetchCategories();
  }

  void fetchCategories() async {
    print('Yes it is fetching');
    _setFetchingData(true);
    var categoryData = await api.fetchCategories();
    if (categoryData['success'] == true) {
      for (var category in categoryData['categories']) {
        _categories.add(Category.fromJson(category));
      }
    } else {
      locator<DialogService>()
          .showAlertDialog('Error', categoryData['message']);
    }
    _setFetchingData(false);
  }
}
