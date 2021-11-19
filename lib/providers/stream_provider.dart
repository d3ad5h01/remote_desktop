import 'dart:async';
import 'package:flutter/material.dart';

class Streams with ChangeNotifier {

  StreamController _terminalStreamController = StreamController();

  String _fileLocation = '-0-';

  String get fileLocation => _fileLocation;
  StreamController get terminalStreamController => _terminalStreamController;

  void reset(String newFileLocation) {
    _fileLocation = newFileLocation;
    notifyListeners();
  }
}