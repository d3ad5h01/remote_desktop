import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/providers/ip_controller_provider.dart';
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

  int loader =0;


  Widget load = Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 20),
        Text('Setting connection..',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 50.0,
            color: Constants.fontColor,
            fontWeight: FontWeight.w600,
          ),),
      ],
    ),
  );

  Widget load2 = Container();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), setterLoad);
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
  void setterLoad()
  {
    setState(() {
      load = SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          //height: 700,
          child: Column(

            children: [

              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Image.asset("assets/images/handPhone.jpg",height:300, width:300),
                ),
              ),
              Text('Welcome',
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
              SizedBox(height:20),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                  child: Text(
                    "Connection Established",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Constants.primaryTextColor,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {

                  //Future.delayed(const Duration(seconds: 5) ,() => Provider.of<Sockett>(context,listen:false).extractSystemInfo(Provider.of<Sockett>(context,listen:false).terminalOutput));

                  setState(() {
                    if(loader==0) {
                      loader=1;
                      setterLoad2();
                      Future.delayed(const Duration(seconds: 7), unsetterLoad2);
                      Future.delayed(const Duration(seconds: 8), navigator);
                      Provider.of<Sockett>(context, listen: false).resetTerminalOutput('Loading..............');
                      String _text = 'systeminfo';
                      Provider.of<Sockett>(context, listen: false).terminal2(_text);
                    }
                    else
                    {
                      Future.delayed(const Duration(seconds: 0), navigator);
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Constants.backColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Constants.fontColor,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Constants.fontColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
    });
  }

  void unsetterLoad2()
  {
    setState(() {
      load2 = Container();
    });
  }

  void setterLoad2()
  {
    setState(() {
      load2 = Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height:10),
          Text('Setting up environment..',
            style: TextStyle(
              fontSize: 15.0,
              color: Constants.fontColor,
              fontWeight: FontWeight.w600,
            ),),
        ],
      );
    });
  }


  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
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
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Center(child: SizedBox(height:600,child: Center(child: load))),
            ),
            load2,
            //Text('Welcome..'),


          ],
        ),
      ),
    );
  }
}
