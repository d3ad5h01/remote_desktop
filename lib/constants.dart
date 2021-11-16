import 'package:flutter/material.dart';
import 'package:language_learning_ui/models/course_model.dart';
import 'package:language_learning_ui/models/instructor_model.dart';
import 'package:language_learning_ui/models/topic_model.dart';
import 'package:language_learning_ui/models/course_model_qc.dart';
import 'dart:io';

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
  // static const Socket socket = null;

static const Color cardIconColor = Color.fromRGBO(179,179,179, 1.0);
  static const Color fontColor = Colors.white;
  static const Color backColor = Color.fromRGBO(18,18,18, 1.0);
  static const Color cardColor1 = Color(0xFF7EC8E3);
  static const Color cardColor2 = Color(0xFFFA26A0);
  static const Color cardColor3 = Color(0xFFF51720);
  static const Color cardColor4 = Color(0xFFF8D210);
  static const Color cardColor5 = Color(0xFF2FF3E0);
  static const Color cardColor6 = Color(0xFF4C5270);
  static const Color cardColor7 = Color(0xFF07BB9C);
  static const Color cardColor8 = Color(0xFF18A558);
  static const Color cardColor9 = Color(0xFF18A558);
  static const Color cardColor10 = Color(0xFF18A558);
  static const Color cardColor11 = Color(0xFFFF4500);
  static const Color cardColor12 = Color(0xFFFF8300);
  static const Color cardColor13 = Color(0xFF6166B3);
  static const Color cardColor14 = Color(0xFFB4FE98);
  static const Color cardColor15 = Color(0xFFB983FF);
  static const Color cardColor16 = Color(0xFFFBD148);
  static const Color cardColor17 = Color(0xFFFF8300);
  static const Color cardColor18 = Color(0xFFFF8300);
  static const Color cardColor19 = Color(0xFFFF8300);
  static const Color cardColor20 = Color(0xFFFF8300);
  static const Color cardColor21 = Color(0xFFFF8300);
  static const Color cardColor22 = Color(0xFFFF8300);
  static const Color cardColor23 = Color(0xFF22577A);
  static const Color cardColor24 = Color(0xFF38A3A5);
  static const Color cardColor25 = Color(0xFF57CC99);
  static const Color cardColor26 = Color(0xFF80ED99);
  // static const Color cardColor29 = Color(0xFF88E0EF);
  // static const Color cardColor28 = Color(0xFF161E54);
  // static const Color cardColor27 = Color(0xFFFF5151);
  // static const Color cardColor30 = Color(0xFF80ED99);


  static const Color cardColor31 = Color(0xFFC85C5C);
  static const Color cardColor32 = Color(0xFFB2EA70);
  static const Color cardColor33 = Color(0xFFFBD148);
  static const Color cardColor34 = Color(0xFFF9975D);


  static const Color cardColor27 = Color(0xFF2B2E4A);
  static const Color cardColor28 = Color(0xFFE84545);
  static const Color cardColor29 = Color(0xFF903749);
  static const Color cardColor30 = Color(0xFF53354A);

  // static const Color cardColor35 = Color(0xFFF38181);
  // static const Color cardColor36 = Color(0xFFFCE38A);
  // static const Color cardColor37 = Color(0xFF95E1D3);
  // static const Color cardColor38 = Color(0xFF6C5B7B);
  static const Color cardColor35 = Color(0xFF2B2E4A);
  static const Color cardColor36 = Color(0xFFE84545);
  static const Color cardColor37 = Color(0xFF903749);
  static const Color cardColor38 = Color(0xFF53354A);
  static const Color cardColor39 = Color(0xFF1FAB89);
  static const Color cardColor40 = Color(0xFF07689F);




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
        name: "Bluetooth",
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
