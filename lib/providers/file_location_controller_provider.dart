import 'package:flutter/material.dart';
import 'package:language_learning_ui/pages/task_manager.dart';

class FileLocationController with ChangeNotifier {
  TextEditingController _fileLocationController = new TextEditingController();
  TextEditingController get fileLocationController => _fileLocationController;
  TextEditingController _taskManagerSearchController = new TextEditingController();
  TextEditingController get taskManagerSearchController => _taskManagerSearchController;

  void reset(String newFileLocation) {
    (_fileLocationController).text = newFileLocation;
    notifyListeners();
  }


}