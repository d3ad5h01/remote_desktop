import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:language_learning_ui/providers/terminal_output_provider.dart';
import 'package:provider/provider.dart';

class Sockett with ChangeNotifier {
  Socket _socket;
  String _terminalOutput ='Output will be printed here.';
  String _taskManagerOutput ='1;./root,0,0;';
  Socket get socket => _socket;
  String get terminalOutput => _terminalOutput;
  String get taskManagerOutput => _taskManagerOutput;

  void reset(String newIp) async {

    print('yes : $newIp');

    // TODO : change this ip to dynamic resolution
    _socket = await Socket.connect('192.168.0.108',6969);
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

  void bluetooth(String arr) {
    String command = "blue:"+arr;
    _socket.write(command);
    notifyListeners();
  }

  void mute() {
    String command = "mute";
    _socket.write(command);
    notifyListeners();
  }

  void terminal(String text){
    String message = "                              ";
    _socket.write("terminal:"+text);
    _socket.listen((data) {
      print("inside");
      message = String.fromCharCodes(data);
      print("Done");
      _terminalOutput = message;
      notifyListeners();
     print('Updated');
    },
    //
    // // handle errors
    // onError: (error) {
    //   print(error);
    // },
    //
    // // handle the client closing the connection
    // onDone: () {
    //   print('command executed');
    // },
    );
    notifyListeners();
    //return message;
  }







  void task_manager() {
    String message = "                              ";
    _socket.write("tasklist");
    _socket.listen((data) {
      notifyListeners();
      _taskManagerOutput = String.fromCharCodes(data);
      notifyListeners();notifyListeners();notifyListeners();
      //print(message);
    },


    // handle errors
    // onError: (error) {
    //   print(error);
    // },
    //
    // // handle the client closing the connection
    // onDone: () {
    //   print('command executed');
    // },
  );

    notifyListeners();


  }

  // void kill_process(String pid)
  // {
  //   String command =
  // }

}

