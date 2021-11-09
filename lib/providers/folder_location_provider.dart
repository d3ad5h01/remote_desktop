import 'package:flutter/material.dart';

class FolderLocation with ChangeNotifier {
  String _folderLocation = '-0-';

  String get folderLocation => _folderLocation;

  void reset(String newFolderLocation) {
    _folderLocation = newFolderLocation;
    notifyListeners();
  }
}