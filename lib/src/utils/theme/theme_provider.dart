import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;
  bool setDarkTheme() => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;

  }
}
