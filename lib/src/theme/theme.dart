import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  late ThemeData _currentTheme;
  late ThemeData _theme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: // Light
        _darkTheme = false;
        _customTheme = false;
        _theme = ThemeData.light();
        _currentTheme = _theme;
        break;
      case 2: // Dark
        _darkTheme = true;
        _customTheme = false;
        _theme = ThemeData.dark();
        _currentTheme = _theme.copyWith(
          colorScheme: _theme.colorScheme.copyWith(secondary: Colors.pink),
        );
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _theme = ThemeData.light();
        _currentTheme = _theme;
    }
  }

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _theme = ThemeData.dark();
      _currentTheme = _theme.copyWith(
        colorScheme: _theme.colorScheme.copyWith(secondary: Colors.pink),
      );
    } else {
      _theme = ThemeData.light();
      _currentTheme = _theme;
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _theme = ThemeData.dark();
      _currentTheme = _theme.copyWith(
        scaffoldBackgroundColor: const Color(0xff16202B),
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
        colorScheme: _theme.colorScheme.copyWith(
          secondary: const Color(0xff48A0EB),
          primary: Colors.white,
        ),
      );
    } else {
      _theme = ThemeData.light();
      _currentTheme = _theme;
    }

    notifyListeners();
  }
}
