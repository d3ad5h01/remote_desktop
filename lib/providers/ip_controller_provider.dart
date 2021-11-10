import 'package:flutter/material.dart';

class IpController with ChangeNotifier {
  TextEditingController _ipController = new TextEditingController();
  TextEditingController get ipController => _ipController;

  void reset(String newIp) {
    (_ipController).text = newIp;
    notifyListeners();
  }
}