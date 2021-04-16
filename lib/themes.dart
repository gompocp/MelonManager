import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CustomThemes currentTheme = CustomThemes();

class CustomThemes with ChangeNotifier {
  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData.light();
  }
  static ThemeData get darkTheme {
    return ThemeData.dark();
  }
}