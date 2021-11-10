import 'package:flutter/material.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:provider/provider.dart';

class IpController with ChangeNotifier {
  TextEditingController _ipController = new TextEditingController();
  TextEditingController get ipController => _ipController;

  void reset(String newIp) {
    (_ipController).text = newIp;
    notifyListeners();

  }
}