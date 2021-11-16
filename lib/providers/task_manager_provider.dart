import 'package:flutter/material.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';

class TaskManagerProvider with ChangeNotifier {
  String _task = '-0-';
  var _table;

  String get task => _task;

  void reset(String newTask) {
    _task = newTask;
    notifyListeners();
  }
}