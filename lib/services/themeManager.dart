import 'dart:async';

import 'package:flutter/material.dart';
import 'package:istemanipalapp/services/locator.dart';
import 'package:istemanipalapp/services/storageService.dart';
import '../consts/themes.dart' as themes;

class ThemeManager {
  StreamController<ThemeData> _themeController = StreamController<ThemeData>();

  Stream<ThemeData> get theme => _themeController.stream;

  var storage = locator<StorageService>();
  int _currentTheme = 0;

  ThemeManager.initialize() {
    getSavedTheme();
  }

  void getSavedTheme() async {
    _currentTheme = await storage.getThemeIndex();
    // Get the theme to apply
    var themeToApply = themes.availableThemes[_currentTheme];
    // Broadcast new theme
    _themeController.add(themeToApply);
  }

  void changeTheme(index) {
    _currentTheme = index;
    storage.storeThemeIndex(_currentTheme);
    // Get the theme to apply
    var themeToApply = themes.availableThemes[_currentTheme];
    // Broadcast new theme
    _themeController.add(themeToApply);
  }

  void toggleLightAndDark() {
    if (_currentTheme == themes.dark) {
      _currentTheme = themes.light;
    } else {
      _currentTheme = themes.dark;
    }
    storage.storeThemeIndex(_currentTheme);
    // Get the theme to apply
    var themeToApply = themes.availableThemes[_currentTheme];
    // Broadcast new theme
    _themeController.add(themeToApply);
  }
}
