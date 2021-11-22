import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:language_learning_ui/providers/terminal_output_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class Sockett with ChangeNotifier {
  var _socket;
  String _terminalOutput = 'Output will be printed here.';
  String _systemInfoOutput = 'Loading..';
  String _taskManagerOutput = '1;1,roo,1;';
  get socket => _socket;
  String _ans = '0';
  String get ans => _ans;

  String get terminalOutput => _terminalOutput;

  String get systemInfoOutput => _systemInfoOutput;

  String get taskManagerOutput => _taskManagerOutput;
  List<List<String>> _table = [
    ['default', '4', '34']
  ];

  List<List<String>> get table => _table;
  int _sze = 1;

  int get sze => _sze;

  void resetTerminalOutput(String newTerminalOutput) {
    _terminalOutput = newTerminalOutput;
    notifyListeners();
  }

  Future<bool> reset(String newIp) async {
    print('yes : $newIp');
    _socket = await WebSocket.connect('ws://192.168.0.6:6969');
    _socket.add('Hello, World!');
    //_socket.add("os");
    // await _socket.listen((data) {
    //   _ans = String.fromCharCodes(data);
    //   notifyListeners();
    // },
    // );
    // TODO : change this ip to dynamic resolution
    // _socket = await Socket.connect('192.168.0.6', 80);

    // _socket.write('Connec ');
    print('Connected ...');
    notifyListeners();
    return true;
  }

  // Future<void> get_os_type() async {
  //   String message = "";
  //   _socket.add("os");
  //   await _socket.listen((data) {
  //       message = String.fromCharCodes(data);
  //       _ans = message;
  //       notifyListeners();
  //     },
  //   );
  //   notifyListeners();
  // }

  void volume(double val) async {
    String command = "s:" + val.toString();
    _socket.add(command);
    notifyListeners();
  }

  void brightness(double val) {
    int NewVal = val.toInt();
    String command = "b:" + NewVal.toString();
    _socket.add(command);
    notifyListeners();
  }

  void media(String arr) {
    String command = "p:" + arr;
    _socket.add(command);
    notifyListeners();
  }

  void arrows(String arr) {
    String command = "m:" + arr;
    _socket.add(command);
    notifyListeners();
  }

  void gameArrows(String arr) {
    String command = "mini:" + arr;
    _socket.add(command);
    notifyListeners();
  }

  void keyboard(String arr) {
    String command = "k:" + arr;
    _socket.add(command);
    notifyListeners();
  }

  void presentation(String arr) {
    String command = "ppt:" + arr;
    _socket.add(command);
    notifyListeners();
  }

  void bluetooth(String arr) {
    String command = "blue:" + arr;
    _socket.add(command);
    notifyListeners();
  }

  void mute() {
    String command = "mute";
    _socket.add(command);
    notifyListeners();
  }

  Future<void> terminal(String text) async {
    String message = "                              ";
    _socket.add("terminal:" + text);
    await _socket.listen(
      (data) {
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

  Future<void> terminal2(String text) async {
    String message = "                              ";
    _socket.add("terminal:" + text);
    await _socket.listen(
          (data) {
        print("inside");
        message = String.fromCharCodes(data);
        print("Done");
        _terminalOutput = message;
        notifyListeners();
        print('Updated');
        extractSystemInfo(_terminalOutput);
      },
    );
    notifyListeners();
    //return message;
  }

  Future<void> terminal3(String text) async {
    String message = "                              ";
    bool cf = true;
    while(cf) {
      _socket.add("terminal:" + text);
      await _socket.listen(
            (data) {
          print("inside");
          message = String.fromCharCodes(data);
          print("Done");
          _terminalOutput = message;
          cf = ifIsNotInt();
          notifyListeners();
          print('Updated');
        },
      );
    }
    notifyListeners();
    //return message;
  }

  String _systemInfo ='';
  String get systemInfo => _systemInfo;

  List<List<String>> _twoCond = [['Host','Name:','OS',''],
    ['OS','Name:','OS',''],
    ['OS','Version:','OS',''],
    ['System','Model:','System',''],
    ['Host','Name:','OS',''],
    ['Host','Name:','OS',''],
    ['Max','Size:','Virtual',''],
    ['In','Use:','Page',''],
    ['Product','ID:','Original',''],
    ['address(es)','[01]:','[02]:',''],
    ['Registered','Owner:','Registered','']

  ];

  List<List<String>> _threeCond = [['Total','Physical','Memory:','Available',''],
    ['Available','Physical','Memory:','Virtual',''],[ 'IP', 'address(es)', '[01]:','[02]:','']];

  List<List<String>> get twoCond => _twoCond;
  List<List<String>> get threeCond => _threeCond;


  void extractSystemInfo(String text)
  {

    _systemInfo = text;

    _systemInfo = _systemInfo.replaceAll('\n', '#');
    _systemInfo = _systemInfo.replaceAll(' ', '#');
    print(_systemInfo);
    var listName = _systemInfo.split('#');
    var newList;
    listName.removeWhere((value) => value == '');

    for(int i=0;i<listName.length-2;i++)
    {
      print(listName[i]);
      for(int k=0;k<_twoCond.length;k++)
      {

        if(listName[i]==_twoCond[k][0]&&listName[i+1]==_twoCond[k][1]){

          for(int j=i+2;j<listName.length;j++)
          {
            print('Found');
            if(listName[j]==_twoCond[k][2])
              break;
            else
              _twoCond[k][3] = _twoCond[k][3] + listName[j] + ' ';
          }
        }

      }

      for(int k=0;k<_threeCond.length;k++)
      {
        if(listName[i]==_threeCond[k][0]&&listName[i+1]==_threeCond[k][1]&&listName[i+2]==_threeCond[k][2]){
          //print('Found');
          for(int j=i+3;j<listName.length;j++)
          {
            if(listName[j]==_threeCond[k][3])
              break;
            else
              _threeCond[k][4] = _threeCond[k][4] + listName[j] + ' ';
          }
        }
      }

      if(listName[i]=='IP')
      {
          _twoCond[9][3]=listName[i+3];
      }



    }
    print(_threeCond[0]);
    print(_threeCond[1]);
    print(_threeCond[2]);
    print(_twoCond[9]);
    print(_twoCond);
  }

  void getTable() {
    int e = _sze;
    int f = 3;
    _table = List.generate(e, (i) => List(f), growable: false);
    int i = 0;
    int j = 0;
    String tmp = "";
    for (int s = 0; s < _terminalOutput.length; s++) {
      if (_terminalOutput[s] == ',') {
        _table[i][j] = tmp;
        tmp = "";
        j++;
      } else if (_terminalOutput[s] == ';') {
        _table[i][j] = tmp;
        tmp = "";
        j = 0;
        i++;
      } else
        tmp = tmp + _terminalOutput[s];
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  bool ifIsNotInt()
  {
    int sze = 0;
    String ret = '';
    //print('Iitial str is ::: $_terminalOutput');
    for (int s = 0; s < _terminalOutput.length; s++) {
      if (_terminalOutput[s] != ';') {
        ret = ret + _terminalOutput[s];
      } else {
        print('ret is::: $ret');
        if (isNumeric(ret)) {
            return false;
        }
        else {
          return true;
        }
        break;
      }
    }
    return false;
  }

  void getSize() {
    _sze = 0;
    String ret = '';
    print('Iitial str is ::: $_terminalOutput');
    for (int s = 0; s < _terminalOutput.length; s++) {
      if (_terminalOutput[s] != ';') {
        ret = ret + _terminalOutput[s];
      } else {
        print('ret is::: $ret');
        if (isNumeric(ret)) {
          _sze = int.parse(ret);
          _terminalOutput = _terminalOutput.substring(s + 1);
        }
        else {
          for (int ss = 0; ss < _terminalOutput.length; ss++)
          {
            if (_terminalOutput[ss] == ';') {
              _sze=_sze+1;
            }
          }
        }
        break;
      }
    }
  }

  Future<void> task_manager() async {
    print('called');
    String message = "";
    bool cf = true;
    int i=1;
    while(cf&&i<5) {
      print('Calling..${i}');
      i++;
      _socket.add("tasklist");
      await _socket.listen(
            (data) {
          _terminalOutput = String.fromCharCodes(data);
          print(_terminalOutput);
          cf = ifIsNotInt();
          notifyListeners();
        },
      );
    }

    notifyListeners();
    //  _socket.close();
    //  reset("");
  }

  void kill_process(String pid) {
    String command = "kill:" + pid;
    _socket.add(command);
    notifyListeners();
  }
}
