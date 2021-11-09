import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/models/course_model.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:language_learning_ui/models/course_model_qc.dart';
import 'package:language_learning_ui/widgets/power_button.dart';
import 'package:language_learning_ui/widgets/primary_button.dart';
import 'package:language_learning_ui/widgets/slider.dart';
import 'package:language_learning_ui/widgets/volume_button.dart';
import 'package:language_learning_ui/widgets/wifi_button.dart';

class CourseCardQC extends StatelessWidget {
  final CourseModelQC courseqc;
  CourseCardQC({this.courseqc});
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
                color: this.courseqc.color,
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
              //child: Image.asset(courseqc.image),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),

                  getWidget(this.courseqc.type),
                  Text(
                    this.courseqc.name,
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


  getWidget(int p)
  {
      if(p == 0)
        {
              return MyStatefulWidget();
        }
      else if(p==1)
        {
            return PrimaryButton(
              text: "Create An Account",
              onPressed: () { },
            );
        }
      else if(p==2)
          return MuteButton();
      else if(p==3)
        return VolumeButton();
      else if(p==4)
        return WifiButton();
      else if(p==5)
        return PowerButton();
  }
}


