import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/darktheme.dart';
import 'package:flutter_application_1/core/theme/lightTheme.dart';

class Themeprovider extends ChangeNotifier {
  //initially light mode
  ThemeData _themeData = lightTheme;

//get theme
  ThemeData get themeData => _themeData;

//get dark more
  bool get isDark => themeData == darkTheme;

  //set theme
  void setTheme() {
    if (_themeData == lightTheme) {
      _themeData = darkTheme; // Switch to dark theme
    } else {
      _themeData = lightTheme; // Switch back to light theme
    }
    notifyListeners(); // Notify the app about the change
  }
}
