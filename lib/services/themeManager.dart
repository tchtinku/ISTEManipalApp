import 'dart:async';

import 'package:flutter/material.dart';
import '../consts/themes.dart' as themes;

class ThemeManager {
  StreamController<ThemeData> _themeController = StreamController<ThemeData>();

  Stream<ThemeData> get theme => _themeController.stream;

  int _currentTheme = 0;

  void changeTheme(index) {
    _currentTheme = index;
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
    // Get the theme to apply
    var themeToApply = themes.availableThemes[_currentTheme];
    // Broadcast new theme
    _themeController.add(themeToApply);
  }
}
