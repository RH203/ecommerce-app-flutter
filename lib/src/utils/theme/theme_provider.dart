import 'package:ecommerce_app/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _themeData;
  late BuildContext _context; 

  bool _isDarkMode = false;

  ThemeProvider(BuildContext context) {
    _context = context; 
    _themeData = lightColorScheme(context);
  }

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _isDarkMode;

  // void setTheme(ThemeData themeData) {
  //   _themeData = themeData;
  //   _isDarkMode = _themeData == darkColorScheme(_context); 
  //   notifyListeners();
  // }

  void toggleTheme(BuildContext context) {
    _themeData = _themeData == lightColorScheme(_context)
        ? darkColorScheme(_context)
        : lightColorScheme(_context);
    _isDarkMode = _themeData == darkColorScheme(_context); 
    notifyListeners();
  }
}
