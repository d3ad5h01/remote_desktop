import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Sockett with ChangeNotifier {
  Socket _socket;
  Socket get socket => _socket;

  void reset(String newIp) async {

    print('yes : $newIp');

    // TODO : change this ip to dynamic resolution
    _socket = await Socket.connect('192.168.0.6',6969);
    _socket.write('Connected ... ');
    print('Connected ...');
    notifyListeners();
  }

  void volume(double val) async {

    String command = "s:"+val.toString();
    _socket.write(command);
    notifyListeners();
  }

  void brightness(double val) {
    int NewVal = val.toInt();
    String command = "b:"+ NewVal.toString();
    _socket.write(command);
    notifyListeners();
  }

  void media(String arr) {
    String command = "p:" + arr;
    _socket.write(command);
    notifyListeners();
  }

  void arrows(String arr) {
    String command = "m:"+arr;
    _socket.write(command);
    notifyListeners();
  }

  void keyboard(String arr) {
    String command = "k:"+arr;
    _socket.write(command);
    notifyListeners();
  }

  void presentation(String arr) {
    String command = "ppt:"+arr;
    _socket.write(command);
    notifyListeners();
  }
}