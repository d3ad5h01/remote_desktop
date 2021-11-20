import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/pages/profile.dart';
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

import 'all_commands.dart';
import 'dashboard.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
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
        if(Provider.of<BottomNavigation>(context,listen:false).bottomNavigation==0)
        {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
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
            height: 800,
            decoration: new BoxDecoration(
              color: Constants.fontColor3,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [

                SizedBox(
                  height: 30.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Constants.fontColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                SizedBox(height: 10.0),
            new Container(

                    height: 250.0,
                    color: Constants.backColor,
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: new Stack(fit: StackFit.loose, children: <Widget>[
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                    width: 140.0,
                                    height: 140.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: new ExactAssetImage(
                                            'assets/images/course-2.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 90.0, right: 100.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new CircleAvatar(
                                      backgroundColor: Constants.cardColor25,
                                      radius: 25.0,
                                      child: new Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )),
                          ]),
                        )
                      ],
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Constants.fontColor,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(Provider.of<Sockett>(context,listen:false).twoCond)[10][3]}',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Constants.fontColor,
                        fontWeight: FontWeight.w200,
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
                        height: 50,
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
                                      "My Devices",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Constants.fontColor3,
                                        fontWeight: FontWeight.w400,
                                      ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Constants.cardColor23,
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
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        height: 50,
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
                                      "History",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Constants.fontColor3,
                                        fontWeight: FontWeight.w400,
                                      ),),
                                    //Text('Volume : ${(context.watch<Volume>().volume).floor()}')
                                  ],
                                ),
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
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          height: 50,
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
                                        "Support",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Constants.fontColor3,
                                          fontWeight: FontWeight.w400,
                                        ),),
                                      //Text('Volume : ${(context.watch<Volume>().volume).floor()}')
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Constants.cardColor25,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                            ],
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
                          height: 50,
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
                                        "Log Out",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Constants.fontColor3,
                                          fontWeight: FontWeight.w400,
                                        ),),
                                      //Text('Volume : ${(context.watch<Volume>().volume).floor()}')

                                    ],
                                  ),
                                ),

                                //CopyCard2(),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Constants.cardColor26,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 10.0,),
                            ],
                          ), //BoxDecoration
                        ), //Container
                      ),
                      //SizedBox

                      //Flexible
                    ], //<Widget>[]
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:language_learning_ui/constants.dart';
//
// class Profile extends StatefulWidget {
//   @override
//   MapScreenState createState() => MapScreenState();
// }
//
// class MapScreenState extends State<Profile>
//     with SingleTickerProviderStateMixin {
//   bool _status = true;
//   final FocusNode myFocusNode = FocusNode();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         body: new Container(
//           //color: Constants.backColor,
//           child: new ListView(
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   new Container(
//                     height: 250.0,
//                     color: Colors.black,
//                     child: new Column(
//                       children: <Widget>[
//                         Padding(
//                             padding: EdgeInsets.only(left: 20.0, top: 20.0),
//                             child: new Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 new Icon(
//                                   Icons.arrow_back_ios,
//                                   color: Colors.black,
//                                   size: 22.0,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 25.0),
//                                   child: new Text('PROFILE',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 20.0,
//                                           fontFamily: 'sans-serif-light',
//                                           color: Colors.black)),
//                                 )
//                               ],
//                             )),
//                         Padding(
//                           padding: EdgeInsets.only(top: 20.0),
//                           child: new Stack(fit: StackFit.loose, children: <Widget>[
//                             new Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 new Container(
//                                     width: 140.0,
//                                     height: 140.0,
//                                     decoration: new BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       image: DecorationImage(
//                                         image: new ExactAssetImage(
//                                             'assets/images/course-2.png'),
//                                         fit: BoxFit.cover,
//                                       ),
//                                     )),
//                               ],
//                             ),
//                             Padding(
//                                 padding: EdgeInsets.only(top: 90.0, right: 100.0),
//                                 child: new Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     new CircleAvatar(
//                                       backgroundColor: Colors.red,
//                                       radius: 25.0,
//                                       child: new Icon(
//                                         Icons.camera_alt,
//                                         color: Colors.white,
//                                       ),
//                                     )
//                                   ],
//                                 )),
//                           ]),
//                         )
//                       ],
//                     ),
//                   ),
//                   new Container(
//                     color: Color(0xffFFFFFF),
//                     child: Padding(
//                       padding: EdgeInsets.only(bottom: 25.0),
//                       child: new Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       new Text(
//                                         'Parsonal Information',
//                                         style: TextStyle(
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       _status ? _getEditIcon() : new Container(),
//                                     ],
//                                   )
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       new Text(
//                                         'Name',
//                                         style: TextStyle(
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 2.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Flexible(
//                                     child: new TextField(
//                                       decoration: const InputDecoration(
//                                         hintText: "Enter Your Name",
//                                       ),
//                                       enabled: !_status,
//                                       autofocus: !_status,
//
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       new Text(
//                                         'Email ID',
//                                         style: TextStyle(
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 2.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Flexible(
//                                     child: new TextField(
//                                       decoration: const InputDecoration(
//                                           hintText: "Enter Email ID"),
//                                       enabled: !_status,
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       new Text(
//                                         'Mobile',
//                                         style: TextStyle(
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 2.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Flexible(
//                                     child: new TextField(
//                                       decoration: const InputDecoration(
//                                           hintText: "Enter Mobile Number"),
//                                       enabled: !_status,
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   Expanded(
//                                     child: Container(
//                                       child: new Text(
//                                         'Pin Code',
//                                         style: TextStyle(
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                     flex: 2,
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                       child: new Text(
//                                         'State',
//                                         style: TextStyle(
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                     flex: 2,
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 2.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   Flexible(
//                                     child: Padding(
//                                       padding: EdgeInsets.only(right: 10.0),
//                                       child: new TextField(
//                                         decoration: const InputDecoration(
//                                             hintText: "Enter Pin Code"),
//                                         enabled: !_status,
//                                       ),
//                                     ),
//                                     flex: 2,
//                                   ),
//                                   Flexible(
//                                     child: new TextField(
//                                       decoration: const InputDecoration(
//                                           hintText: "Enter State"),
//                                       enabled: !_status,
//                                     ),
//                                     flex: 2,
//                                   ),
//                                 ],
//                               )),
//                           !_status ? _getActionButtons() : new Container(),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
//
//   @override
//   void dispose() {
//     // Clean up the controller when the Widget is disposed
//     myFocusNode.dispose();
//     super.dispose();
//   }
//
//   Widget _getActionButtons() {
//     return Padding(
//       padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
//       child: new Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(right: 10.0),
//               child: Container(
//                   child: new RaisedButton(
//                     child: new Text("Save"),
//                     textColor: Colors.white,
//                     color: Colors.green,
//                     onPressed: () {
//                       setState(() {
//                         _status = true;
//                         FocusScope.of(context).requestFocus(new FocusNode());
//                       });
//                     },
//                     shape: new RoundedRectangleBorder(
//                         borderRadius: new BorderRadius.circular(20.0)),
//                   )),
//             ),
//             flex: 2,
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(left: 10.0),
//               child: Container(
//                   child: new RaisedButton(
//                     child: new Text("Cancel"),
//                     textColor: Colors.white,
//                     color: Colors.red,
//                     onPressed: () {
//                       setState(() {
//                         _status = true;
//                         FocusScope.of(context).requestFocus(new FocusNode());
//                       });
//                     },
//                     shape: new RoundedRectangleBorder(
//                         borderRadius: new BorderRadius.circular(20.0)),
//                   )),
//             ),
//             flex: 2,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _getEditIcon() {
//     return new GestureDetector(
//       child: new CircleAvatar(
//         backgroundColor: Colors.red,
//         radius: 14.0,
//         child: new Icon(
//           Icons.edit,
//           color: Colors.white,
//           size: 16.0,
//         ),
//       ),
//       onTap: () {
//         setState(() {
//           _status = false;
//         });
//       },
//     );
//   }
// }
