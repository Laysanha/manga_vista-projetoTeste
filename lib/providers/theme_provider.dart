import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light(useMaterial3: true);
  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme =
      _currentTheme = _currentTheme.brightness == Brightness.light
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true);
    notifyListeners();
  }
}