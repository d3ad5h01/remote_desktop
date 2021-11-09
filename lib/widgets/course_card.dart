import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/models/course_model.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;
  CourseCard({this.course});
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 40.0,
      height: ScreenUtil().setHeight(50.0),
      width: ScreenUtil().setWidth(145.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: this.course.color,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                    offset: Offset(1.0,2.0),
                  )
                ]
              ),
              //child: Image.asset(course.image),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Icon(
                    Icons.desktop_mac,
                    color: Constants.primaryTextColor,
                  ),
                  Text(
                    this.course.name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Constants.primaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 10.0,
                    ),
                  ),
                  Text(
                    this.course.specs,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Constants.primaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),

                ],
              ),

            ),
          ),
          // Container(
          //   height: 40.0,
          //   child: Text(
          //     this.course.name,
          //     maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(
          //       color: Constants.primaryTextColor,
          //       fontWeight: FontWeight.w600,
          //       fontSize: 14.0,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 5.0,
          ),
          // Container(
          //   height: 40.0,
          //   child: Text(
          //     this.course.name,
          //     maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(
          //       color: Constants.primaryTextColor,
          //       fontWeight: FontWeight.w600,
          //       fontSize: 14.0,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
