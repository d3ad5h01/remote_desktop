import 'package:flutter/material.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';

class TaskManagerProvider with ChangeNotifier {
  String _task = '-0-';
  String _pid='None';

  String get task => _task;
  String get pid => _pid;

  void reset(String newTask) {
    _task = newTask;
    notifyListeners();
  }
  void resetPid(String newPid)
  {
    _pid = newPid;
    notifyListeners();
  }
}