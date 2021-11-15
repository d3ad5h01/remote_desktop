import 'package:flutter/material.dart';

class KeyboardController with ChangeNotifier {
  TextEditingController _keyboardController = new TextEditingController();
  TextEditingController get keyboardController => _keyboardController;

  String text(){
    return (_keyboardController).text;
  }
  void reset(String newKeyboard) {
    (_keyboardController).text = newKeyboard;
    notifyListeners();
  }
}