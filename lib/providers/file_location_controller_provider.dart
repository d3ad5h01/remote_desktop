import 'package:flutter/material.dart';

class FileLocationController with ChangeNotifier {
  TextEditingController _fileLocationController = new TextEditingController();
  TextEditingController get fileLocationController => _fileLocationController;

  void reset(String newFileLocation) {
    (_fileLocationController).text = newFileLocation;
    notifyListeners();
  }
}