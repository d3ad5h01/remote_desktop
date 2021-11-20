import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/providers/keyboard_controller_provider.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:language_learning_ui/widgets/expansion_tile_card_demo.dart';
import 'package:language_learning_ui/widgets/volume_button.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import 'package:language_learning_ui/providers/file_location_provider.dart';
import 'package:language_learning_ui/providers/folder_location_provider.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';
import 'package:language_learning_ui/providers/folder_location_controller_provider.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';

class GameControls extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListDemo(),
    );
  }
}

class ListDemo extends StatefulWidget {

  @override
  const ListDemo({Key key})
      : super(key: key);

  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Widget build(BuildContext context) {
    //int isSelected =0;
    // sze = widget.sze;
    final isSelected = <bool>[false, false, false];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,size:30),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Input Controller"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),

      body: Container(
        decoration: new BoxDecoration(
          color: Constants.backColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              //SizedBox(height: 20),
              //Center(child: Text('Selected Media file: ${context.watch<FileLocation>().fileLocation}')),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Mini Clip Keyboard',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(

                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              Provider.of<Sockett>(context,listen:false).arrows("u");
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.arrow_upward_sharp,
                              color: Colors.black,
                              size: 60.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(

                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              Provider.of<Sockett>(context,listen:false).arrows("l");
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.black,
                              size: 60.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              Provider.of<Sockett>(context,listen:false).arrows("click");
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.arrow_downward_sharp,
                              color: Colors.black,
                              size: 60.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              Provider.of<Sockett>(context,listen:false).arrows("r");
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.black,
                              size: 60.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(

                  children: <Widget>[

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              Provider.of<Sockett>(context,listen:false).arrows("d");
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Space',
                              style: TextStyle(fontSize: 25,color: Constants.fontColor2),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              Provider.of<Sockett>(context,listen:false).arrows("d");
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Enter',
                              style: TextStyle(fontSize: 25,color: Constants.fontColor2),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              KeyboardCard(),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Center(
              //     child: Text(
              //       'Keyboard Access',
              //       style: TextStyle(fontSize: 25),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: TextFormField(
              //     cursorColor: Theme.of(context).cursorColor,
              //     controller: context.watch<KeyboardController>().keyboardController,
              //     decoration: InputDecoration(
              //       //labelText: 'Label text',
              //       labelStyle: TextStyle(
              //         color: Color(0xFF6200EE),
              //       ),
              //       hintText: 'Input as keyboard',
              //       suffixIcon: Icon(
              //         Icons.keyboard,
              //       ),
              //       border: OutlineInputBorder(),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: OutlinedButton(
              //     onPressed: () {
              //       setState(() {
              //         String _text = Provider.of<KeyboardController>(context,listen:false).text();
              //         Provider.of<KeyboardController>(context,listen:false).reset('');
              //         Provider.of<Sockett>(context,listen:false).keyboard(_text);
              //       });
              //     },
              //     child: Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: Text('Send',style: TextStyle(fontSize: 25),),
              //     ),
              //     style: ElevatedButton.styleFrom(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12), // <-- Radius
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

}
