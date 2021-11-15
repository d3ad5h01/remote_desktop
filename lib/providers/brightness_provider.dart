import 'package:flutter/material.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';

class Brightness with ChangeNotifier {
  double _brightness = 0;

  double get brightness => _brightness;

  void reset(double newBrightness) {
    _brightness = newBrightness;
    notifyListeners();
    //print('${_brightness.floor()}');
  }
}
