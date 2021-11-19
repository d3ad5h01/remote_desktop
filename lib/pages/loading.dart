import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/providers/task_manager_provider.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:language_learning_ui/widgets/expansion_tile_card_demo.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import 'package:language_learning_ui/providers/file_location_provider.dart';
import 'package:language_learning_ui/providers/folder_location_provider.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';
import 'package:language_learning_ui/providers/folder_location_controller_provider.dart';

class Loading extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListDemo(),
    );
  }
}

class ListDemo extends StatefulWidget {
  //@override
  //const ListDemo({Key key}) : super(key: key);
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {




  Widget load =Column(
    children: [
      CircularProgressIndicator(),
      Text('Loading..',
        style: TextStyle(
          fontSize: 50.0,
          color: Constants.fontColor,
          fontWeight: FontWeight.w600,
        ),),
    ],
  );
  @override
  void initState() {
    super.initState();
    //load=CircularProgressIndicator();
    Future.delayed(const Duration(seconds: 3), Setter);
    Future.delayed(const Duration(seconds: 4), navigator);
  }

  void navigator()
  {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  Dashboard(),
      ),
    );
  }

  void Setter()
  {
    setState(() {
      load = Column(
        children: [

          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Image.asset("assets/images/handPhone.jpg",height:300, width:300),
            ),
          ),Text('Welcome',
            style: TextStyle(
              fontSize: 30.0,
              color: Constants.fontColor,
              fontWeight: FontWeight.w600,
            ),),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "REMOTE DESKTOP",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Constants.primaryTextColor,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }



  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   //icon: Icon(Icons.arrow_back, color: Colors.black,size:30),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        //title: Text("Task Manager"),
        backgroundColor: Constants.backColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: new BoxDecoration(
          color: Constants.backColor,
        ),
        child: ListView(
          children: [
            SizedBox(height: 10),
            SizedBox(width:100,height:500,child: Center(child: load)),
            //Text('Welcome..'),


          ],
        ),
      ),
    );
  }
}
