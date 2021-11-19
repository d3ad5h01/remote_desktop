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
import 'package:language_learning_ui/providers/terminal_output_provider.dart';



class SystemInfo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListDemo(),
    );
  }
}

class ListDemo extends StatefulWidget {
  @override
  const ListDemo({Key key}) : super(key: key);

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
        //title: Text("Terminal"),
        backgroundColor: Constants.backColor,
        centerTitle: true,
        elevation: 0,
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
                    "System Info",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Constants.fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Provider.of<Sockett>(context,listen:false).resetTerminalOutput('Loading..............');
                        String _text = 'systeminfo';
                        Provider.of<Sockett>(context,listen:false).terminal(_text);
                      //     Provider.of<Sockett>(context,listen:false).task_manager();
                      //     k = Provider.of<Sockett>(context,listen:false).taskManagerOutput;
                      //
                       });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Constants.backColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Constants.fontColor,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Get Info",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Constants.fontColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 30),
                              Container(
                                decoration: BoxDecoration(
                                      color: Constants.backColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Constants.fontColor,
                                        width: 1,
                                      ),
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(Provider.of<Sockett>(context,listen:true).terminalOutput,
                                      style: TextStyle(
                                      fontSize: 15.0,
                                      color: Constants.fontColor,
                                      fontWeight: FontWeight.w600,
                                  ),),
                                ),
                              ),
                              
                              
                              //CopyCard2(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


