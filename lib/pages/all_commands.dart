

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/pages/mouse_keyboard.dart';
import 'package:language_learning_ui/pages/presentation.dart';
import 'package:language_learning_ui/pages/profile.dart';
//import 'package:language_learning_ui/pages/profile.dart';
import 'package:language_learning_ui/pages/task_manager.dart';
import 'package:language_learning_ui/pages/terminal_emulator.dart';
import 'package:language_learning_ui/providers/bottom_navigation.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:language_learning_ui/providers/volume_provider.dart';
import 'package:language_learning_ui/widgets/border_text_field.dart';
import 'package:language_learning_ui/widgets/brightness_button.dart';
import 'package:language_learning_ui/widgets/course_card.dart';
import 'package:language_learning_ui/widgets/course_card_qc.dart';
import 'package:language_learning_ui/widgets/expansion_tile_card_demo.dart';
import 'package:language_learning_ui/widgets/instructor_card.dart';
import 'package:language_learning_ui/widgets/server_button.dart';
import 'package:language_learning_ui/widgets/topics_list.dart';
import 'package:language_learning_ui/widgets/user_menu_bar.dart';
import 'package:language_learning_ui/widgets/active_project_card.dart';
import 'package:expandable/expandable.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:language_learning_ui/providers/file_location_provider.dart';
import 'package:language_learning_ui/providers/folder_location_provider.dart';
import 'package:language_learning_ui/widgets/volume_button.dart';
import 'package:language_learning_ui/widgets/bluetooth_button.dart';
import 'package:provider/provider.dart';
import 'package:language_learning_ui/providers/brightness_provider.dart';
import 'package:language_learning_ui/providers/bottom_navigation.dart';
import 'package:provider/provider.dart';

import 'file_system.dart';
import 'media_controller.dart';


class AllCommands extends StatefulWidget {
  @override
  _AllCommandsState createState() => _AllCommandsState();
}


class _AllCommandsState extends State<AllCommands> {
  @override
  Color color = Colors.grey;

  Widget build(BuildContext context) {
    var _selectedIndex=0;
    void _onTap(int index)
    {
      setState(() {
        Provider.of<BottomNavigation>(context,listen:false).reset(index);
        print(Provider.of<BottomNavigation>(context,listen:false).bottomNavigation);
        if(Provider.of<BottomNavigation>(context,listen:false).bottomNavigation==0)
        {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
            ),
          );
        }
        if(Provider.of<BottomNavigation>(context,listen:false).bottomNavigation==2)
        {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profile(),
            ),
          );
        }
      });
    }
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          currentIndex: Provider.of<BottomNavigation>(context,listen:false).bottomNavigation,
          onTap: _onTap,
          showUnselectedLabels: false,
          iconSize: 22,
          elevation: 0,
          backgroundColor: Colors.transparent,

          unselectedIconTheme: IconThemeData(
            color: Constants.cardIconColor,
          ),
          selectedIconTheme: IconThemeData(
            color: Constants.kRed,
          ),
          items: [
            BottomNavigationBarItem(
              label: "",
              icon:
              Icon(
                Icons.home,
                size: 25.0,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon:
              Icon(
                Icons.apps,
                size: 25.0,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon:
              Icon(
                Icons.person,
                size: 25.0,
              ),
            ),


          ],

        ),
      ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: new BoxDecoration(
              color: Constants.backColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [

                SizedBox(
                  height: 30.0,
                ),
                //UserMenuBar(),
                Center(
                  child:
                      Text(
                        "All Commands",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Constants.fontColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                BorderTextField(
                  prefixIcon: Icon(
                    FlutterIcons.search_fea,
                    color: Colors.grey,
                  ),
                  borderRadius: 50.0,
                  hintText: "Search...",
                ),
                SizedBox(
                  height: 30.0,
                ),
                //Quick Controls
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: (){
                          print("Terminal Emulator button ");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  TerminalEmulator(),
                            ),
                          );
                        },
                        child: Container(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Terminal Emulator",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Constants.fontColor,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                ),
                                SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.center,
                                  child:  Icon(
                                    Icons.settings,
                                    color: Colors.black,
                                    size: 40.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Constants.cardColor44,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                            ],
                          ), //BoxDecoration
                        ),
                      ), //Container
                    ), //Flexible
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: (){
                          print("Remote Mouse and Keyboard button ");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  MouseKeyboard(),
                            ),
                          );
                        },
                        child: Container(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Remote Mouse and Keyboard",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Constants.fontColor,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child:  Icon(
                                    Icons.mouse,
                                    color: Colors.black,
                                    size: 40.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Constants.cardColor45,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                            ],
                          ), //BoxDecoration
                        ),
                      ), //Container
                    ), //
                    //Flexible
                  ], //<Widget>[]
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: (){
                          print("Media Control");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>   MediaController(),
                            ),
                          );
                        },
                        child: Container(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Media Controller",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Constants.fontColor,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                ),
                                SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child:  Icon(
                                    Icons.audiotrack,
                                    color: Colors.black,
                                    size: 40.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Constants.cardColor46,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                            ],
                          ), //BoxDecoration
                        ),
                      ), //Container
                    ), //Flexible
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: (){
                          print("Task Manager");
                          //Provider.of<Sockett>(context,listen:false).task_manager();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  TaskManager(),
                            ),
                          );
                        },
                        child: Container(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Task Manager",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Constants.fontColor,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child:  Icon(
                                    Icons.table_chart,
                                    color: Colors.black,
                                    size: 40.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Constants.cardColor47,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                            ],
                          ), //BoxDecoration
                        ),
                      ), //Container
                    ), //
                    //Flexible
                  ], //<Widget>[]
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: (){
                          print("Presentation button ");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  PresentationController(),
                            ),
                          );
                        },
                        child: Container(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Presentation",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Constants.fontColor,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child:  Icon(
                                    Icons.slideshow,
                                    color: Colors.black,
                                    size: 40.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Constants.cardColor49,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                            ],
                          ), //BoxDecoration
                        ),
                      ), //Container
                    ), //Flexible
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: (){
                          print("Remote Mouse and Keyboard button ");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  MouseKeyboard(),
                            ),
                          );
                        },
                        child: Container(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Remote Mouse and Keyboard",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Constants.fontColor,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child:  Icon(
                                    Icons.mouse,
                                    color: Colors.black,
                                    size: 40.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Constants.cardColor48,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                            ],
                          ), //BoxDecoration
                        ),
                      ), //Container
                    ), //
                    //Flexible
                  ], //<Widget>[]
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  height: 500,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
