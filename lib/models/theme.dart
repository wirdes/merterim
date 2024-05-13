import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  Brightness currentTheme = Brightness.light;

  Brightness get getCurrentTheme => currentTheme;

  void toggleTheme() {
    currentTheme =
        currentTheme == Brightness.light ? Brightness.dark : Brightness.light;
    notifyListeners();
  }
}
