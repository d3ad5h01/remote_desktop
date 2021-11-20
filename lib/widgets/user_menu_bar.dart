import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:language_learning_ui/constants.dart';

class UserMenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

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
                  text: "Remote Desktop",
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
    );
  }
}
