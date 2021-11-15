import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_ui/pages/create_account.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/pages/home.dart';
import 'package:language_learning_ui/pages/lesson_screen.dart';
import 'package:language_learning_ui/providers/brightness_provider.dart';
import 'package:language_learning_ui/providers/file_location_provider.dart';
import 'package:language_learning_ui/providers/folder_location_provider.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';
import 'package:language_learning_ui/providers/folder_location_controller_provider.dart';
import 'package:language_learning_ui/pages/file_system.dart';
import 'package:language_learning_ui/providers/ip_controller_provider.dart';
import 'package:language_learning_ui/providers/keyboard_controller_provider.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:language_learning_ui/providers/volume_provider.dart';
import 'package:provider/provider.dart';
import 'package:language_learning_ui/widgets/brightness_button.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FileLocation()),
        ChangeNotifierProvider(create: (_) => FolderLocation()),
        ChangeNotifierProvider(create: (_) => FileLocationController()),
        ChangeNotifierProvider(create: (_) => FolderLocationController()),
        ChangeNotifierProvider(create: (_) => Volume()),
        ChangeNotifierProvider(create: (_) => IpController()),
        ChangeNotifierProvider(create: (_) => Sockett()),
        ChangeNotifierProvider(create: (_) => Brightness()),
        ChangeNotifierProvider(create: (_) => KeyboardController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        // routes: {
        //   '/': (BuildContext context) => Home(),
        //   '/dashboard': (BuildContext context) => Dashboard(),
        //   '/fileSystem': (BuildContext context) => FileSystem(),
        //   //'/listdemo': (BuildContext context) => ListDemo(),
        //   //'/file_system': (BuildContext context) => FileSystem(),
        //   //'/another': (BuildContext context) => Another()
        // },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.rubikTextTheme(
            TextTheme(),
          ),
        ),
        initialRoute: "/",
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
    case "/create-account":
      return MaterialPageRoute(builder: (BuildContext context) {
        return CreateAccount();
      });
    case "/dashboard":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Dashboard();
      });
    case "/lesson-screen":
      return MaterialPageRoute(builder: (BuildContext context) {
        return LessonScreen();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
  }
}
