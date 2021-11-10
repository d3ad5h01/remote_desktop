import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Sockett with ChangeNotifier {
  Socket _socket = null;
  Socket get socket => _socket;

  void reset(String newIp) async {

    print('yes : $newIp');

    await Socket.connect('192.168.0.6',6969).then((socket){
      socket.write('Connected ... ');
      print('Sonn');
    });

    notifyListeners();
  }
}