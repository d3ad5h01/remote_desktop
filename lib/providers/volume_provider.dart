import 'package:flutter/material.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';


class Volume with ChangeNotifier {
  double _volume = 0;
  bool _ifMute=false;
  double get volume => _volume;
  bool get ifMute => _ifMute;


  void reset(double newVolume) {
    _volume = newVolume;
    if(_volume==0)
      _ifMute =true;
    else
      _ifMute = false;
    notifyListeners();
    //print('${_volume.floor()}');
  }
  void setMute(bool newMute) {
    _ifMute = newMute;
    notifyListeners();
    //print('${_volume.floor()}');
  }

}