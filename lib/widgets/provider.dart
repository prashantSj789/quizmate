import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UiProvider extends ChangeNotifier {


  bool _isDark = false;
  bool get isDark => _isDark;

  late SharedPreferences storage;

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
    //save value to storage
    storage.setBool('isDark', _isDark);
    notifyListeners();
  }

  //Init method of provider
  void init() async {
    storage = await SharedPreferences.getInstance();
    //to get the value
    _isDark= storage.getBool('isDark')??false;
    notifyListeners();
  }
}
