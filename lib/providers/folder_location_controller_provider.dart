import 'package:flutter/material.dart';

class FolderLocationController with ChangeNotifier {
  TextEditingController _folderLocationController = new TextEditingController();
  TextEditingController get folderLocationController => _folderLocationController;

  void reset(String newFolderLocation) {
    (_folderLocationController).text = newFolderLocation;
    notifyListeners();
  }
}