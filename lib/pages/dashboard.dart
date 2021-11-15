import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';
import 'package:language_learning_ui/widgets/border_text_field.dart';
import 'package:language_learning_ui/widgets/course_card.dart';
import 'package:language_learning_ui/widgets/course_card_qc.dart';
import 'package:language_learning_ui/widgets/expansion_tile_card_demo.dart';
import 'package:language_learning_ui/widgets/instructor_card.dart';
import 'package:language_learning_ui/widgets/topics_list.dart';
import 'package:language_learning_ui/widgets/user_menu_bar.dart';
import 'package:language_learning_ui/widgets/active_project_card.dart';
import 'package:expandable/expandable.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:language_learning_ui/providers/file_location_provider.dart';
import 'package:language_learning_ui/providers/folder_location_provider.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
  @override
  Color color = Colors.white;

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(
          color: Color.fromRGBO(202, 205, 219, 1),
        ),
        selectedIconTheme: IconThemeData(
          color: Constants.primaryColor,
        ),
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(FlutterIcons.home_fea),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              FlutterIcons.calendar_fea,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              FlutterIcons.edit_fea,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              FlutterIcons.user_fea,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
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
                // Text('Testing purppose'),
                // Text('${context.watch<FileLocation>().fileLocation}'),
                // Text('${context.watch<FolderLocation>().folderLocation}'),
                // Text('${(context.watch<FileLocationController>().fileLocationController).text}'),
                // ElevatedButton.icon(
                //   onPressed: () {
                //     //Navigator.pushNamed(context),
                //     context.read<FileLocationController>().reset('changed text of controller');
                //     //getLocationSource("Changed0004884");
                //   },
                //   style: ButtonStyle(
                //     backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                //     padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                //     //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                //   ),
                //
                //   icon: Icon(Icons.file_copy, size: 20),
                //   label: Text("Change controller text"),
                // ),
                // ElevatedButton.icon(
                //   onPressed: () {
                //     //Navigator.pushNamed(context),
                //       context.read<FileLocation>().reset('changed location of file');
                //       //getLocationSource("Changed0004884");
                //   },
                //   style: ButtonStyle(
                //     backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                //     padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                //     //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                //   ),
                //
                //   icon: Icon(Icons.file_copy, size: 20),
                //   label: Text("Change GLobaal file loc"),
                // ),
                // ElevatedButton.icon(
                //   onPressed: () {
                //     //Navigator.pushNamed(context),
                //     context.read<FolderLocation>().reset('changed location of folder');
                //     //getLocationSource("Changed0004884");
                //   },
                //   style: ButtonStyle(
                //     backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                //     padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                //     //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                //   ),
                //
                //   icon: Icon(Icons.file_copy, size: 20),
                //   label: Text("Change GLobaal file loc"),
                // ),
                //TopicsList(),
                //SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Device Specs",
                      style: TextStyle(
                        fontSize: 21.0,
                        color: Constants.primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Text(
                    //   "View all",
                    //   style: TextStyle(
                    //     fontSize: 15.0,
                    //     color: Constants.captionTextColor,
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                SizedBox(height: 10.0),
                Container(
                  height: ScreenUtil().setHeight(130.0),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10.0,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: Constants.courses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CourseCard(
                        course: Constants.courses[index],
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quick Control",
                      style: TextStyle(
                        fontSize: 21.0,
                        color: Constants.primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: ScreenUtil().setHeight(167.0),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10.0,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: Constants.coursesqc.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CourseCardQC(
                        courseqc: Constants.coursesqc[index],
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "More Commands",
                  style: TextStyle(
                    fontSize: 21.0,
                    color: Constants.primaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),


                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //subheading('Active Projects'),
                      SizedBox(height: 5.0),
                      Row(
                        children: <Widget>[
                          // ActiveProjectsCard(
                          //   cardColor: Constants.kGreen,
                          //   loadingPercent: 0.25,
                          //   title: 'Medical App',
                          //   subtitle: '9 hours progress',
                          // ),
                          // SizedBox(width: 20.0),
                        ],
                      ),


                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          CopyCard1(),
                          SizedBox(height: 30,),
                          PresentationControlCard(),
                          SizedBox(height: 30,),
                          MediaControlCard(),
                          SizedBox(height: 30,),
                          MouseKeyboardCard(),
                           // CopyCard3(),

                          SizedBox(height: 30,),
                          //CopyCard2(),
                        ],
                      ),
                      SizedBox(height: 50,),
                    ],
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

