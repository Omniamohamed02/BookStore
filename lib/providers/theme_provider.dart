import 'package:flutter/material.dart';

class ThemesProvider with ChangeNotifier {
  bool _isDarkMode = false;


  ThemeData get currentTheme => _isDarkMode ? _darkMode : _lightMode;
  bool get isDarkMode => _isDarkMode;


  final ThemeData _lightMode = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black87),
    ),
  );

  final ThemeData _darkMode = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
