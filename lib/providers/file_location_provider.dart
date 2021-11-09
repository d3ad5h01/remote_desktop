import 'package:flutter/material.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';

class FileLocation with ChangeNotifier {
  String _fileLocation = '-0-';

  String get fileLocation => _fileLocation;

  void reset(String newFileLocation) {
    _fileLocation = newFileLocation;
    notifyListeners();
  }
}