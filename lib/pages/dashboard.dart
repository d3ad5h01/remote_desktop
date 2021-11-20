import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
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
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  AllCommands(),
              ),
            );
          }
        if(Provider.of<BottomNavigation>(context,listen:false).bottomNavigation==2)
        {
          Navigator.pop(context);
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
      bottomNavigationBar: //(((Provider.of<Sockett>(context,listen:false).twoCond)[9][3])!='')?
      Container(
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
      //     :Container(
      //   decoration: new BoxDecoration(
      //     color: Colors.white,
      //   ),
      //   child: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     showSelectedLabels: false,
      //     currentIndex: 0,
      //     //onTap: _onTap,
      //     showUnselectedLabels: false,
      //     iconSize: 22,
      //     elevation: 0,
      //     backgroundColor: Colors.transparent,
      //
      //     unselectedIconTheme: IconThemeData(
      //       color: Colors.white,
      //     ),
      //     selectedIconTheme: IconThemeData(
      //       color: Colors.white,
      //     ),
      //     items: [
      //       BottomNavigationBarItem(
      //         label: "",
      //         icon:
      //         Icon(
      //           Icons.apps,
      //           size: 25.0,
      //         ),
      //       ),
      //       BottomNavigationBarItem(
      //         label: "",
      //         icon:
      //         Icon(
      //           Icons.apps,
      //           size: 25.0,
      //         ),
      //       ),
      //
      //
      //     ],
      //
      //   ),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: (((Provider.of<Sockett>(context,listen:false).twoCond)[9][3])!='')?Container(
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
                Container(

                  child: Row(
                    children: [
                      SizedBox(
                        width: 15.0,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Welcome to ,\n",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromRGBO(152, 156, 173, 1),
                              ),
                            ),
                            TextSpan(
                              text: "Remote Desktop \n",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Constants.primaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.menu ,
                          color: Constants.primaryTextColor,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Device Specs",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Constants.fontColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
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
                                    color: Constants.fontColor3,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),
                              SizedBox(height: 5),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '${(Provider.of<Sockett>(context,listen:false).twoCond)[9][3]}',
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
                                    color: Constants.fontColor3,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),
                              SizedBox(height: 5),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '${(Provider.of<Sockett>(context,listen:false).twoCond)[1][3]}',
                                  style: TextStyle(
                                    fontSize: 18.0,
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
                                    color: Constants.fontColor3,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),
                              SizedBox(height: 5),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '${(Provider.of<Sockett>(context,listen:false).twoCond)[0][3]}',
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
                                    color: Constants.fontColor3,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),
                              SizedBox(height: 5),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '${(Provider.of<Sockett>(context,listen:false).twoCond)[8][3]}',
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
                          color: Constants.cardColor41,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                          ],
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
                              (((Provider.of<Sockett>(context,listen:false).twoCond)[9][3])!='')?Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.devices_outlined,
                                  color: Constants.fontColor,
                                  size: 30.0,
                                ),
                              ):Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons. desktop_access_disabled,
                                  color: Constants.fontColor,
                                  size: 30.0,
                                ),
                              ),

                              SizedBox(height: 10),
                              (((Provider.of<Sockett>(context,listen:false).twoCond)[9][3])!='')?Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Connected",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Constants.fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ):Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Disconnected",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Constants.fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),

                              //CopyCard2(),
                            ],
                          ),
                        ),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:  Constants.cardColor42,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                            ],
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
                                    color: Constants.fontColor,
                                    size: 40.0,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "95%",
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
                            color: Constants.cardColor43,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                             setState(() {
                               print('More tapped');
                               //Provider.of<Sockett>(context,listen:false).terminal('systeminfo');

                               //String tmpVar = Provider.of<Sockett>(context,listen:true).systemInfoOutput;
                               //if(tmpVar!='Loading..')
                               //Provider.of<Sockett>(context,listen:false).getSystemInfo();
                                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SystemInfo(),
                            ),
                          );
                                      });
                          },
                          child: Container(
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
                                      Icons.more_horiz,
                                      color: Constants.fontColor,
                                      size: 40.0,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "More",
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
                              color:  Constants.cardColor31,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                     //Flexible
                  ], //<Widget>[]
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                
                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quick Controls",
                      style: TextStyle(
                        fontSize: 20.0,
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
                                        color: Constants.fontColor3,
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
                          boxShadow: [
                            BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                          ],
                        ),
                        //BoxDecoration
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
                  height: 20,
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
                                        color: Constants.fontColor3,
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
                                child: VolumeButton(cur: Constants.fontColor3),
                              ),

                              //CopyCard2(),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Constants.cardColor24,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                          ],
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
                  height: 20,
                ),
                // Row(
                //   children: <Widget>[
                //     Flexible(
                //       flex: 1,
                //       fit: FlexFit.tight,
                //       child: Container(
                //         height: 120,
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               Align(
                //                 alignment: Alignment.topCenter,
                //                 child: Row(
                //                   children: [
                //                     Text(
                //                       "Bluetooth",
                //                       style: TextStyle(
                //                         fontSize: 18.0,
                //                         color: Constants.fontColor,
                //                         fontWeight: FontWeight.w400,
                //                       ),),
                //                     //Text('Volume : ${(context.watch<Volume>().volume).floor()}')
                //                   ],
                //                 ),
                //               ),
                //
                //               Align(
                //                 alignment: Alignment.center,
                //                 child: BluetoothButton(),
                //               ),
                //
                //               //CopyCard2(),
                //             ],
                //           ),
                //         ),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: Constants.cardColor25,
                //           boxShadow: [
                //             BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                //           ],
                //         ), //BoxDecoration
                //       ), //Container
                //     ), //Flexible
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Flexible(
                //       flex: 1,
                //       fit: FlexFit.tight,
                //       child: Container(
                //         height: 120,
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               Align(
                //                 alignment: Alignment.topLeft,
                //                 child: Row(
                //                   children: [
                //                     Text(
                //                       "Server",
                //                       style: TextStyle(
                //                         fontSize: 18.0,
                //                         color: Constants.fontColor,
                //                         fontWeight: FontWeight.w400,
                //                       ),),
                //                     //Text('Volume : ${(context.watch<Volume>().volume).floor()}')
                //
                //                   ],
                //                 ),
                //               ),
                //               SizedBox(height: 10),
                //               //Text('Brightness : ')
                //               Align(
                //                 alignment: Alignment.topCenter,
                //                 child: ServerButton(),
                //               ),
                //
                //               //CopyCard2(),
                //             ],
                //           ),
                //         ),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: Constants.cardColor26,
                //           boxShadow: [
                //             BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                //           ],
                //         ), //BoxDecoration
                //       ), //Container
                //     ),
                //
                //     //SizedBox
                //
                //     //Flexible
                //   ], //<Widget>[]
                //   mainAxisAlignment: MainAxisAlignment.center,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: InkWell(

                        child: Container(
                          height: 120,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: (){
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return RestartDialog();
                                        });
                                  },
                                  child: GestureDetector(
                                    onTap : (){
                                      Provider.of<Sockett>(context,listen:false).terminal('shutdown /g');
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              "Restart",
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
                                              Icons.refresh,
                                              color: Colors.black,
                                              size: 40.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return SleepDialog();
                                        });
                                  },
                                  child: GestureDetector(
                                    onTap : (){
                                      Provider.of<Sockett>(context,listen:false).terminal('shutdown /h');
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              "Sleep",
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
                                              Icons.brightness_2_outlined ,
                                              color: Colors.black,
                                              size: 40.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return ShutDownDialog();
                                        });
                                  },
                                  child: GestureDetector(
                                    onTap: (){
                                      Provider.of<Sockett>(context,listen:false).terminal('shutdown /sg');
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              "Shut Down",
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
                                              Icons.power_settings_new,
                                              color: Colors.black,
                                              size: 40.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                    ),


                    //Flexible

                    //Flexible
                  ], //<Widget>[]
                  //mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ):Padding(
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
                        Navigator.pop(context);
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



class SleepDialog extends StatefulWidget {
  @override
  _SleepDialogState createState() => new _SleepDialogState();
}

class _SleepDialogState extends State<SleepDialog> {
  Color _c = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Constants.backColor,
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Sleep the desktop',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.red,
          fontWeight: FontWeight.w200,
        ),
      ),
      // content: Padding(
      //   padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Text(
      //         'This will sleep the desktop.',
      //         style: TextStyle(
      //           fontSize: 15.0,
      //           color: Constants.fontColor,
      //           fontWeight: FontWeight.w200,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      actions: <Widget>[
        FlatButton(
          textColor: Constants.fontColor,
          onPressed: () => Navigator.pop(context),
          child: Text('CANCEL'),
        ),
        FlatButton(
          textColor: Colors.red,
          onPressed: () {
            setState(() {
              String _text = 'shutdown /l';
              Provider.of<Sockett>(context,listen:false).terminal(_text);
              Navigator.pop(context);
            });
          },
          child: Text('Sleep'),
        ),
      ],
    );
  }
}

class RestartDialog extends StatefulWidget {
  @override
  _RestartDialogState createState() => new _RestartDialogState();
}

class _RestartDialogState extends State<RestartDialog> {
  Color _c = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Constants.backColor,
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Restart the desktop',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.red,
          fontWeight: FontWeight.w200,
        ),
      ),

      actions: <Widget>[
        FlatButton(
          textColor: Constants.fontColor,
          onPressed: () => Navigator.pop(context),
          child: Text('CANCEL'),
        ),
        FlatButton(
          textColor: Colors.red,
          onPressed: () {
            setState(() {
              String _text = 'shutdown /r';
              Provider.of<Sockett>(context,listen:false).terminal(_text);
              Navigator.pop(context);
            });
          },
          child: Text('Restart'),
        ),
      ],
    );
  }
}

class ShutDownDialog extends StatefulWidget {
  @override
  _ShutDownDialogState createState() => new _ShutDownDialogState();
}

class _ShutDownDialogState extends State<ShutDownDialog> {
  Color _c = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Constants.backColor,
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Shut Down the desktop',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.red,
          fontWeight: FontWeight.w200,
        ),
      ),

      actions: <Widget>[
        FlatButton(
          textColor: Constants.fontColor,
          onPressed: () => Navigator.pop(context),
          child: Text('CANCEL'),
        ),
        FlatButton(
          textColor: Colors.red,
          onPressed: () {
            setState(() {
              String _text = 'shutdown /s';
              Provider.of<Sockett>(context,listen:false).terminal(_text);
              Navigator.pop(context);
            });
          },
          child: Text('Shut Down'),
        ),
      ],
    );
  }
}
