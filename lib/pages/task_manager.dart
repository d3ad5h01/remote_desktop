import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/providers/task_manager_provider.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:language_learning_ui/widgets/expansion_tile_card_demo.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import 'package:language_learning_ui/providers/file_location_provider.dart';
import 'package:language_learning_ui/providers/folder_location_provider.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';
import 'package:language_learning_ui/providers/folder_location_controller_provider.dart';

class TaskManager extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListDemo(),
    );
  }
}

class ListDemo extends StatefulWidget {
  //@override
  //const ListDemo({Key key}) : super(key: key);
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {

  @override
  void initState() {
    super.initState();
    Provider.of<Sockett>(context,listen:false).task_manager();
  }

  String k = '';
  int _selectedIndex = -1;
  String dir;
  int sze;
  var dirArr;

  //final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  // var items = List<List<String>>();

  // @override
  // void initState() {
  //   items.addAll(Provider.of<Sockett>(context, listen: false).table);
  //   super.initState();
  // }

  // void filterSearchResults(String query) {
  //   List<List<String>> dummySearchList = List<List<String>>();
  //   dummySearchList.addAll(Provider.of<Sockett>(context, listen: false).table);
  //   if (query.isNotEmpty) {
  //     List<List<String>> dummyListData = List<List<String>>();
  //     dummySearchList.forEach((item) {
  //       if (item[0].contains(query)) {
  //         dummyListData.add(item);
  //       }
  //     });
  //     setState(() {
  //       items.clear();
  //       items.addAll(dummyListData);
  //     });
  //     return;
  //   } else {
  //     setState(() {
  //       items.clear();
  //       items.addAll(Provider.of<Sockett>(context, listen: false).table);
  //     });
  //   }
  // }

  Widget build(BuildContext context) {
    //k = Provider.of<Sockett>(context,listen:false).taskManagerOutput;
    // print(dir);
    //getSize();
    //dirArrayMaker();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,size:30),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //title: Text("Task Manager"),
        backgroundColor: Constants.backColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: new BoxDecoration(
          color: Constants.backColor,
        ),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: InkWell(
                  onTap: () {
                    // setState(() {
                    //     Provider.of<Sockett>(context,listen:false).task_manager();
                    //     k = Provider.of<Sockett>(context,listen:false).taskManagerOutput;
                    //
                    // });
                  },
                  child: Container(
                    child: Icon(
                      Icons.airplay,
                      color: Constants.fontColor,
                      size: 50.0,
                    ),
                  ),
                ),
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
                          // setState(() {
                          //   // Provider.of<Sockett>(context, listen: false)
                          //   //     .task_manager();
                          // });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.refresh,
                            color: Constants.fontColor,
                            size: 30.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
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
                          //setState(() {
                            // k = Provider.of<Sockett>(context, listen: false)
                            //     .taskManagerOutput;
                            //items.addAll(Provider.of<Sockett>(context, listen: false).table);
                         // });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.arrow_upward_sharp,
                            color: Constants.fontColor,
                            size: 30.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Container(
            //     decoration: new BoxDecoration(
            //       color: Constants.fontColor,
            //         borderRadius: BorderRadius.all(Radius.circular(10))
            //     ),
            //     child: TextFormField(
            //       cursorColor: Theme.of(context).cursorColor,
            //       controller: context.watch<FileLocationController>().taskManagerSearchController,
            //       decoration: InputDecoration(
            //         //labelText: 'Label text',
            //         labelStyle: TextStyle(
            //           color: Color(0xFF6200EE),
            //         ),
            //         hintText: 'Input as keyboard',
            //         suffixIcon: Icon(
            //           Icons.keyboard,
            //         ),
            //         border: OutlineInputBorder(),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //     padding: EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            //   child: Container(
            //     decoration: new BoxDecoration(
            //       color: Constants.fontColor,
            //         borderRadius: BorderRadius.all(Radius.circular(10))
            //     ),
            //     child: OutlinedButton(
            //       onPressed: () {
            //         setState(() {
            //           // String _text = Provider.of<KeyboardController>(context,listen:false).text();
            //           // Provider.of<KeyboardController>(context,listen:false).reset('');
            //           // Provider.of<Sockett>(context,listen:false).keyboard(_text);
            //         });
            //       },
            //       child: Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: Text('Search',style: TextStyle(fontSize: 25),),
            //       ),
            //       style: ElevatedButton.styleFrom(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12), // <-- Radius
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //     padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
            //   child: Container(
            //       decoration: new BoxDecoration(
            //               color: Constants.fontColor3,
            //                 borderRadius: BorderRadius.all(Radius.circular(10))
            //             ),
            //     child: TextField(
            //       onChanged: (value) {
            //         filterSearchResults(value);
            //       },
            //       controller: context.watch<FileLocationController>().taskManagerSearchController,
            //       decoration: InputDecoration(
            //           //labelText: "Search",
            //           hintText: "Search",
            //           prefixIcon: Icon(Icons.search),
            //           border: OutlineInputBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            //     ),
            //   ),
            // ),

            // SizedBox(height: 10),
            // Container(
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: items.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text(
            //           '${items[index][0]}',
            //           style: TextStyle(
            //             fontSize: 20.0,
            //             color: Constants.fontColor,
            //             fontWeight: FontWeight.w200,
            //           ),
            //         ),
            //         isThreeLine: true,
            //         subtitle: Text(
            //           'PID: ${items[index][1]} \nRam Occupied:${items[index][2]}K',
            //           style: TextStyle(
            //             fontSize: 15.0,
            //             color: Constants.fontColor,
            //             fontWeight: FontWeight.w200,
            //           ),
            //         ),
            //         leading: Icon(
            //           Icons.settings_rounded,
            //           color: Constants.fontColor,
            //         ),
            //         //selected: countToValue[i] ?? false,
            //         trailing: OutlinedButton(
            //           onPressed: () {
            //             setState(() {
            //               _selectedIndex = index;
            //               //name = dirArr[i][0];
            //               Provider.of<TaskManagerProvider>(context, listen: false)
            //                   .reset((Provider.of<Sockett>(context, listen: false)
            //                   .table)[_selectedIndex][0]);
            //               Provider.of<TaskManagerProvider>(context, listen: false)
            //                   .resetPid(
            //                   (Provider.of<Sockett>(context, listen: false)
            //                       .table)[_selectedIndex][1]);

            //               //print(name);
            //               //await Future.delayed(const Duration(seconds: 2), (){});
            //               //showDialog<void>(context: context, builder: (context) => dialog);
            //               showDialog(
            //                   context: context,
            //                   builder: (_) {
            //                     return MyDialog();
            //                   });
            //               // print(name);
            //             });
            //           },
            //           child: Padding(
            //             padding: const EdgeInsets.all(10.0),
            //             child: Icon(
            //               Icons.close_outlined,
            //               color: Colors.red,
            //               size: 40.0,
            //             ),
            //           ),
            //           style: OutlinedButton.styleFrom(
            //             side: BorderSide(width: 1.0, color: Constants.fontColor),
            //           ),
            //         ),

            //         // Checkbox(
            //         //   value: _selectedIndex == i,
            //         //   onChanged: (bool value) {
            //         //     setState(() {
            //         //       //countToValue[i] = value;
            //         //       _selectedIndex = i;
            //         //       LocFile = (dirArr[_selectedIndex][1]=='Folder')?('empty'):dirArr[_selectedIndex][3];
            //         //     });
            //         //   },
            //         // ),
            //         onTap: () {},
            //       );
            //     },
            //   ),
            // ),
            //for (int i=0,a=dirArr[i][0],b=dirArr[i][1],c=dirArr[i][2],d=dirArr[i][3] ; (i< dir.length);i++,a=dirArr[i][0],b=dirArr[i][1],c=dirArr[i][2],d=dirArr[i][3])
            for (int i = 0;
                (i < Provider.of<Sockett>(context, listen: false).sze);
                i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    '${(Provider.of<Sockett>(context, listen: true).table)[i][0]}',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Constants.fontColor,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  isThreeLine: true,
                  subtitle: Text(
                    'PID: ${(Provider.of<Sockett>(context, listen: true).table)[i][1]} \nRam Occupied:${(Provider.of<Sockett>(context, listen: true).table)[i][2]}K',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Constants.fontColor,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  leading: Icon(
                    Icons.settings_rounded,
                    color: Constants.cardColor8,
                  ),
                  //selected: countToValue[i] ?? false,
                  trailing: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = i;
                        //name = dirArr[i][0];
                        Provider.of<TaskManagerProvider>(context, listen: false)
                            .reset((Provider.of<Sockett>(context, listen: false)
                                .table)[_selectedIndex][0]);
                        Provider.of<TaskManagerProvider>(context, listen: false)
                            .resetPid(
                                (Provider.of<Sockett>(context, listen: false)
                                    .table)[_selectedIndex][1]);

                        //print(name);
                        //await Future.delayed(const Duration(seconds: 2), (){});
                        //showDialog<void>(context: context, builder: (context) => dialog);
                        showDialog(
                            context: context,
                            builder: (_) {
                              return MyDialog();
                            });
                        // print(name);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.close_outlined,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Constants.fontColor),
                    ),
                  ),

                  // Checkbox(
                  //   value: _selectedIndex == i,
                  //   onChanged: (bool value) {
                  //     setState(() {
                  //       //countToValue[i] = value;
                  //       _selectedIndex = i;
                  //       LocFile = (dirArr[_selectedIndex][1]=='Folder')?('empty'):dirArr[_selectedIndex][3];
                  //     });
                  //   },
                  // ),
                  onTap: () {},
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  Color _c = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Constants.backColor,
      contentPadding: EdgeInsets.zero,
      title: Text(
        'End Task ?',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.red,
          fontWeight: FontWeight.w200,
        ),
      ),
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'This will end the process ${Provider.of<TaskManagerProvider>(context, listen: false).task}. Its PID is: ${Provider.of<TaskManagerProvider>(context, listen: false).pid}.',
              style: TextStyle(
                fontSize: 15.0,
                color: Constants.fontColor,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        // FlatButton(
        //     child: Text('Switch'),
        //     onPressed: () => setState(() {
        //       _c == Colors.redAccent
        //           ? _c = Colors.blueAccent
        //           : _c = Colors.redAccent;
        //     }))
        FlatButton(
          textColor: Constants.fontColor,
          onPressed: () => Navigator.pop(context),
          child: Text('CANCEL'),
        ),
        FlatButton(
          textColor: Colors.red,
          onPressed: () {
            setState(() {
              Provider.of<Sockett>(context, listen: false).kill_process(
                  Provider.of<TaskManagerProvider>(context, listen: false).pid);
              Navigator.pop(context);
            });
          },
          child: Text('END PROCESS'),
        ),
      ],
    );
  }
}
