import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/pages/create_account.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/pages/dashboard_linux.dart';
import 'package:language_learning_ui/pages/loading_linux.dart';
import 'package:language_learning_ui/providers/ip_controller_provider.dart';
import 'package:language_learning_ui/widgets/primary_button.dart';
import 'package:provider/provider.dart';
import 'package:language_learning_ui/providers/folder_location_provider.dart';
import 'package:language_learning_ui/providers/folder_location_controller_provider.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'loading.dart';

String tempIp;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final isSelected = <bool>[true, false];

  Future<void> getIpAndNavigate ()
  async {
    var tempIpControler = Provider.of<IpController>(context,listen:false).ipController;
    tempIp = tempIpControler.text;
    bool connectionTry = false;
    Fluttertoast.showToast(
        msg: "before ip await",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    connectionTry =  await  Provider.of<Sockett>(context,listen:false).reset(tempIp);
   // navigator(connectionTry);
   String k = 'connectionTry : ' + connectionTry.toString(); 
   Fluttertoast.showToast(
      msg: k,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
    navigator(true);
  }

  void navigator(bool connectionTry)
  {
    if(isSelected[0]){
      print('Tapped');
  //     Fluttertoast.showToast(
  //     msg: 'toLoading',
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     backgroundColor: Colors.red,
  //     textColor: Colors.white,
  //     fontSize: 16.0
  // );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  Loading(),
        ),
      );
    }
    else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  LoadingLinux(),
          ),
        );
    }

  }

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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
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
              ),
              SizedBox(
                height: 10.0,
              ),
              ToggleButtons(
                color: Colors.black.withOpacity(0.60),
                selectedColor: Color(0xFF6200EE),
                selectedBorderColor: Color(0xFF6200EE),
                fillColor: Color(0xFF6200EE).withOpacity(0.08),
                splashColor: Color(0xFF6200EE).withOpacity(0.12),
                hoverColor: Color(0xFF6200EE).withOpacity(0.04),
                borderRadius: BorderRadius.circular(4.0),
                constraints: BoxConstraints(minHeight: 36.0),
                isSelected: isSelected,
                onPressed: (index) {
                  // Respond to button selection
                  setState(() {
                    isSelected[index] = !isSelected[index];
                    isSelected[(index+1)%2] = !isSelected[(index+1)%2];

                  });
                },
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                    child: Text('WINDOW'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                    child: Text('LINUX'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryButton(
                  text: "Sign In",
                  onPressed: () {
                    print('Signing in..');
                    Fluttertoast.showToast(
                      msg: "Tapped",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                    //setState(() {

                      getIpAndNavigate();
                    //});
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) {
                    //       return Loading();
                    //     },
                    //   ),
                    // );
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: PrimaryButton(
              //     text: "Temp Button",
              //     onPressed: () {
              //       print('Signing in..');
              //       setState(() {
              //         navigator(false);
              //       });
              //       // Navigator.of(context).push(
              //       //   MaterialPageRoute(
              //       //     builder: (BuildContext context) {
              //       //       return Loading();
              //       //     },
              //       //   ),
              //       // );
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
