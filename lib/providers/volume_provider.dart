import 'package:flutter/material.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';


class Volume with ChangeNotifier {
  double _volume = 0;
  double get volume => _volume;

  void reset(double newVolume) {
    _volume = newVolume;
    notifyListeners();
    print('${_volume.floor()}');
  }
}