import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/pages/create_account.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/providers/ip_controller_provider.dart';
import 'package:language_learning_ui/widgets/primary_button.dart';
import 'package:provider/provider.dart';
import 'package:language_learning_ui/providers/folder_location_provider.dart';
import 'package:language_learning_ui/providers/folder_location_controller_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Image.asset("assets/images/handPhone.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  "REMOTE DESKTOP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: Constants.primaryTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Complete Desktop Control at your hand",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Constants.captionTextColor,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (BuildContext context) {
              //           return Dashboard();
              //         },
              //       ),
              //     );
              //   },
              //   child: Container(
              //     width: double.infinity,
              //     height: ScreenUtil().setHeight(50.0),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(8.0),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Color.fromRGBO(169, 176, 185, 0.42),
              //           spreadRadius: 0,
              //           blurRadius: 8,
              //           offset: Offset(0, 2), // changes position of shadow
              //         ),
              //       ],
              //     ),
              //     child: Center(
              //       child: Text(
              //         "Sign In",
              //         style: GoogleFonts.roboto(
              //           color: Color.fromRGBO(169, 176, 185, 1.0),
              //           fontSize: 18.0,
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                //initialValue: context.watch<FolderLocation>().folderLocation,
                controller: context.watch<IpController>().ipController,
                //maxLength: 20,
                decoration: InputDecoration(
                  // icon: IconButton(icon: new Icon(Icons.home), onPressed: () {
                  // //   Navigator.push(
                  // //   context,
                  // //   MaterialPageRoute(
                  // //     builder: (context) => FileSystem(getLocationSource: getLocationSource),
                  // //   ),
                  // // );
                  // //
                  // },),
                  //Icon(Icons.folder),
                  //labelText: 'Label text',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                  hintText: 'Input Ip',
                  //helperText: 'Click icon to select from directory',
                  // suffixIcon: Icon(
                  //   Icons.check_circle,
                  // ),
                  // enabledBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(color: Color(0xFF6200EE)),
                  // ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              PrimaryButton(
                text: "Sign In",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Dashboard();
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
