import 'package:flutter/material.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';

class TerminalOutput with ChangeNotifier {
  String _terminalOutput = 'NONE';

  String get terminalOutput => _terminalOutput;

  void reset(String newTerminalOutput) {
    _terminalOutput = newTerminalOutput;
    notifyListeners();
  }
}