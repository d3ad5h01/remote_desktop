import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/pages/home.dart';
import 'package:language_learning_ui/pages/profile.dart';
//import 'package:language_learning_ui/pages/profile.dart';
import 'package:language_learning_ui/providers/bottom_navigation.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';
import 'package:language_learning_ui/providers/ip_controller_provider.dart';
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
import 'package:language_learning_ui/pages/sys_info.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';

import 'all_commands.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
  @override
  Color color = Colors.grey;

  Widget build(BuildContext context) {
    var _selectedIndex=0;
    void _onTap(int index)
    {
      setState(() {
        Provider.of<BottomNavigation>(context,listen:false).reset(index);
        print(Provider.of<BottomNavigation>(context,listen:false).bottomNavigation);
        if(Provider.of<BottomNavigation>(context,listen:false).bottomNavigation==1)
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  AllCommands(),
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
      bottomNavigationBar:
      Container(
        decoration: new BoxDecoration(
          color: Colors.white,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          currentIndex: 0,
          //onTap: _onTap,
          showUnselectedLabels: false,
          iconSize: 22,
          elevation: 0,
          backgroundColor: Colors.transparent,

          unselectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          selectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          items: [
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
                Icons.apps,
                size: 25.0,
              ),
            ),


          ],

        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 800,
              decoration: new BoxDecoration(
                color: Constants.backColor,
              ),
              child:Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text('Error In Establishing Connection',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Constants.fontColor,
                        fontWeight: FontWeight.w600,
                      ),),
                    Icon(
                      Icons.error ,
                      color: Constants.primaryTextColor,
                      size: 100,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
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
                              padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                              child: Text(
                                "Try Again",
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}