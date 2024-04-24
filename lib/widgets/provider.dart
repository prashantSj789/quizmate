import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {


  bool _isDark = false;
  bool get isDark => _isDark;

  //Custom dark theme setting
  final darkTheme = ThemeData(
    primaryColor: Colors.black12,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black12,
  );

  //Custom dark theme setting
  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    primaryColorDark: Colors.white,
  );

  //Dark Theme toggle action
  changeTheme() {
    _isDark = !isDark;
    notifyListeners();
  }

  //Init method of provider
  void init() {
    notifyListeners();
  }
}
