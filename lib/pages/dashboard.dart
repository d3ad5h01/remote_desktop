import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
//import 'package:language_learning_ui/pages/profile.dart';
import 'package:language_learning_ui/providers/bottom_navigation.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';
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

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => Profile(),
          //   ),
          // );
        }
      });
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        currentIndex: Provider.of<BottomNavigation>(context,listen:false).bottomNavigation,
        onTap: _onTap,
        showUnselectedLabels: false,
        iconSize: 22,
        elevation: 0,
        backgroundColor: Constants.backColor,

        unselectedIconTheme: IconThemeData(
          color: Constants.cardIconColor,
        ),
        selectedIconTheme: IconThemeData(
          color: Constants.cardColor8,
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
                UserMenuBar(),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Device Specs",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Constants.fontColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        height: 330,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Device Ip",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Constants.fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "172.21.2.4",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Constants.fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),
                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "OS Name:",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Constants.fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Microsoft Windows 10",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Constants.fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),
                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Host Name',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Constants.fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "DESKTOP-VP1F6F0",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Constants.fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),
                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Product ID',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Constants.fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "00347-35849-54819-AAOEM",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Constants.fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),
                              //CopyCard2(),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Constants.cardColor27,
                        ), //BoxDecoration
                      ), //Container
                    ), //Flexible
                    SizedBox(
                      width: 10,
                    ),
                    //SizedBox

                    Column(
                      children: [
                        Container(
                          height: 100.0,
                          width: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.devices_outlined,
                                  color: Colors.black,
                                  size: 40.0,
                                ),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Connected",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Constants.fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),

                              //CopyCard2(),
                            ],
                          ),
                        ),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:  Constants.cardColor28,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100.0,
                          width: 100.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.battery_std,
                                    color: Colors.black,
                                    size: 40.0,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "90%",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Constants.fontColor,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                ),

                                //CopyCard2(),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Constants.cardColor29,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100.0,
                          width: 100.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.wifi,
                                    color: Colors.black,
                                    size: 40.0,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "Wifi",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Constants.fontColor,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                ),

                                //CopyCard2(),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:  Constants.cardColor30,
                          ),
                        ),

                      ],
                    ),
                     //Flexible
                  ], //<Widget>[]
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  height: 40,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quick Controls",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Constants.fontColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 15.0,
                ),

                //Quick Controls
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      "Brightness :",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Constants.fontColor,
                                        fontWeight: FontWeight.w400,
                                      ),),
                                    Text(
                                      "  ${(context.watch<Brightness>().brightness).floor()}",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Constants.backColor,
                                        fontWeight: FontWeight.w900,
                                      ),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              //Text('Brightness : ')
                              Align(
                                alignment: Alignment.topLeft,
                                child: BrightnessButton(),
                              ),

                              //CopyCard2(),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Constants.cardColor23,
                        ), //BoxDecoration
                      ), //Container
                    ), //Flexible
                    SizedBox(
                      width: 10,
                    ),
                    //SizedBox

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
                      child: Container(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      "Volume :",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Constants.fontColor,
                                        fontWeight: FontWeight.w400,
                                      ),),
                                    //Text('Volume : ${(context.watch<Volume>().volume).floor()}')
                                    Text(
                                      "  ${(context.watch<Volume>().volume).floor()}",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Constants.backColor,
                                        fontWeight: FontWeight.w900,
                                      ),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              //Text('Brightness : ')
                              Align(
                                alignment: Alignment.topLeft,
                                child: VolumeButton(),
                              ),

                              //CopyCard2(),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Constants.cardColor24,
                        ), //BoxDecoration
                      ), //Container
                    ), //Flexible
                    SizedBox(
                      width: 10,
                    ),
                    //SizedBox

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
                      child: Container(
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  children: [
                                    Text(
                                      "Bluetooth",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Constants.fontColor,
                                        fontWeight: FontWeight.w400,
                                      ),),
                                    //Text('Volume : ${(context.watch<Volume>().volume).floor()}')
                                  ],
                                ),
                              ),

                              Align(
                                alignment: Alignment.center,
                                child: BluetoothButton(),
                              ),

                              //CopyCard2(),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Constants.cardColor25,
                        ), //BoxDecoration
                      ), //Container
                    ), //Flexible
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      "Server",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Constants.fontColor,
                                        fontWeight: FontWeight.w400,
                                      ),),
                                    //Text('Volume : ${(context.watch<Volume>().volume).floor()}')

                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              //Text('Brightness : ')
                              Align(
                                alignment: Alignment.topCenter,
                                child: ServerButton(),
                              ),

                              //CopyCard2(),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Constants.cardColor26,
                        ), //BoxDecoration
                      ), //Container
                    ),
                    //SizedBox

                    //Flexible
                  ], //<Widget>[]
                  mainAxisAlignment: MainAxisAlignment.center,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
