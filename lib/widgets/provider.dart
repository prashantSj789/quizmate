import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

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
