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
  String _taskManagerOutput ='1;1,roo,1;';
  Socket get socket => _socket;
  String get terminalOutput => _terminalOutput;
  String get taskManagerOutput => _taskManagerOutput;
  List<List<String>> _table =[['default','4','34']];
  List<List<String>> get table => _table;
  int _sze =1;
  int get sze => _sze;
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

    );
    notifyListeners();
    //return message;
  }



  void getTable() {
    int e = _sze;
    int f = 3;
    _table = List.generate(e, (i) => List(f), growable: false);
    int i = 0;
    int j = 0;
    String tmp = "";
    for (int s = 0; s < _taskManagerOutput.length; s++) {
      if (_taskManagerOutput[s] == ',') {
        _table[i][j] = tmp;
        tmp = "";
        j++;
      } else if (_taskManagerOutput[s] == ';') {
        _table[i][j] = tmp;
        tmp = "";
        j = 0;
        i++;
      } else
        tmp = tmp + _taskManagerOutput[s];
    }
  }

  void getSize()
  {
    _sze=0;
    String ret='';
    for(int s=0;s<_taskManagerOutput.length;s++)
    {
      if(_taskManagerOutput[s]!=';') {
        ret = ret+ _taskManagerOutput[s];
      }
      else{
        //print(ret);
        _sze = int.parse(ret);
        _taskManagerOutput = _taskManagerOutput.substring(s+1);
        break;
      }
    }
    // print(_taskManagerOutput.length);
    // print('size is');
    // print(sze);
  }




  void task_manager() {
    String message = "                              ";
    _socket.write("tasklist");
    _socket.listen((data) {
      _taskManagerOutput = String.fromCharCodes(data);
      // getSize();
      // getTable();
      notifyListeners();
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
   //  _socket.close();
   //  reset("");
  }

  void kill_process(String pid)
  {
    String command = "kill:"+pid;
    _socket.write(command);
    notifyListeners();
  }

}

