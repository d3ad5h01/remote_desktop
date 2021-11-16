import 'package:flutter/material.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';

class BottomNavigation with ChangeNotifier {
  int _bottomNavigation = 0;

  int get bottomNavigation => _bottomNavigation;

  void reset(int newBottomNavigation) {
    _bottomNavigation = newBottomNavigation;
    notifyListeners();
  }
}