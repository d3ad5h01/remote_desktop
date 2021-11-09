import 'package:flutter/material.dart';
import 'package:language_learning_ui/models/course_model.dart';
import 'package:language_learning_ui/models/instructor_model.dart';
import 'package:language_learning_ui/models/topic_model.dart';
import 'package:language_learning_ui/models/course_model_qc.dart';

//globals
// TextEditingController file_location_controller = new TextEditingController();
// TextEditingController folder_location_controller = new TextEditingController();
//

class Constants {

  static const Color kLightYellow = Color(0xFFFFF9EC);
  static const Color kLightYellow2 = Color(0xFFFFE4C7);
  static const Color kDarkYellow = Color(0xFFF9BE7C);
  static const Color kPalePink = Color(0xFFFED4D6);

  static const Color kRed = Color(0xFFE46472);
  static const Color kLavender = Color(0xFFD5E4FE);
  static const Color kBlue = Color(0xFF6488E4);
  static const Color kLightGreen = Color(0xFFD9E6DC);
  static const Color kGreen = Color(0xFF309397);

  static const Color kDarkBlue = Color(0xFF0D253F);
  static const Color primaryTextColor = Color.fromRGBO(38, 50, 98, 1);
  static const Color captionTextColor = Color.fromRGBO(157, 161, 180, 1);
  static const Color primaryColor = Color.fromRGBO(200, 92, 92, 1.0);

  static List<TopicModel> topics = [
    TopicModel(
      color: Constants.primaryColor,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(255, 99, 128, 0.6),
          spreadRadius: 0,
          blurRadius: 6,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
      topic: "interjections & colloquial",
      time: "30 min",
      points: "20",
      //image: "assets/images/course-1.png",
    ),
    TopicModel(
      color: Color.fromRGBO(25, 118, 210, 1),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(25, 118, 210, 0.6),
          spreadRadius: 0,
          blurRadius: 6,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
      topic: "interjections & colloquial",
      time: "30 min",
      points: "30",
     // image: "assets/images/course-2.png",
    )
  ];
  static List<String> courseLevels = [
    "Beginner",
    "Intermediate",
    "Advanced",
    "Professional"
  ];
  static List<CourseModel> courses = [
    CourseModel(
      name: "Device Model",
      color: Colors.blueAccent,
      image: "assets/images/course-3.png",
      specs: "HP Pavalion",
      icon: "desktop_mac"
    ),
    CourseModel(
      name: "Device IP",
      color: Color.fromRGBO(255, 152, 117, 1),
      image: "assets/images/course-4.png",
      specs: "172.31.2.4",
        icon: "desktop_mac"
    ),
    CourseModel(
      name: "Battery Percentage",
      color: Color.fromRGBO(255, 133, 125, 1),
      image: "assets/images/course-5.png",
      specs: "90%",
        icon: "desktop_mac"
    ),
  ];

  static List<CourseModelQC> coursesqc = [
    CourseModelQC(
        name: "Brightness",
        color: Colors.greenAccent,
        image: "assets/images/course-3.png",
        specs: "HP Pavalion",
        icon: "desktop_mac",
        type: 0,
    ),
    CourseModelQC(
        name: "Volume",
        color: Color.fromRGBO(255, 152, 117, 1),
        image: "assets/images/course-4.png",
        specs: "172.31.2.4",
        icon: "desktop_mac",
        type: 3,
    ),

    CourseModelQC(
        name: "Wifi",
        color: Colors.lightGreenAccent,
        image: "assets/images/course-5.png",
        specs: "90%",
        icon: "desktop_mac",
        type: 4,
    ),
    CourseModelQC(
        name: "Power",
        color: Colors.lightGreenAccent,
        image: "assets/images/course-5.png",
        specs: "90%",
        icon: "desktop_mac",
        type: 5,
    ),
  ];
  static List<InstructorModel> instructors = [
    InstructorModel(
      name: "Jennifer Lee",
      occupation: "UI Designer",
      image: "assets/images/person-1.png",
    ),
    InstructorModel(
      name: "Olayemii Garuba",
      occupation: "Software Dev",
      image: "assets/images/person-2.png",
    ),
    InstructorModel(
      name: "Christopher Gary",
      occupation: "Software Dev",
      image: "assets/images/person-3.png",
    )
  ];
}
