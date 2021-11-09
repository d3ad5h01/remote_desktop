import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/widgets/expansion_tile_card_demo.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import 'package:language_learning_ui/providers/file_location_provider.dart';
import 'package:language_learning_ui/providers/folder_location_provider.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';
import 'package:language_learning_ui/providers/folder_location_controller_provider.dart';


class FileSystem extends StatelessWidget {
  final getLocationSource;

  const FileSystem({Key key, this.getLocationSource}) : super(key: key);

  Widget build(BuildContext context) {
    String dir =
        'Tez,Folder,1 GB,C:/Desktop/Tez;File2.txt,txt,2 kb,C:/Desktop/File2.txt;File3.txt,txt,2 kb,C:/Desktop/File3.txt;Tez,Folder,1 GB,C:/Desktop/Tez;File2.txt,txt,2 kb,C:/Desktop/File2.txt;File3.txt,txt,2 kb,C:/Desktop/File3.txt;Tez,Folder,1 GB,C:/Desktop/Tez;File2.txt,txt,2 kb,C:/Desktop/File2.txt;File3.txt,txt,2 kb,C:/Desktop/File3.txt;';
    int sze = 9;
    return Scaffold(
      body: ListDemo(dir: dir, sze: sze, getLocationSource: getLocationSource),
    );
  }
}

class ListDemo extends StatefulWidget {
  final String dir;
  final int sze;
  final getLocationSource;

  @override
  const ListDemo({Key key, this.dir, this.sze, this.getLocationSource})
      : super(key: key);

  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  int _selectedIndex = -1;
  String dir = 'empty';
  String Loc = 'empty';
  String LocFile = 'empty';
  String LocDir = 'empty';
  int sze;
  int _currentTabIndex = 0;

  var dirArr;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
  ];
  Map<int, bool> countToValue = <int, bool>{};



  String getDirectory(String currLoc) {
    setState(() {
      dir = 'NewDirectory,Folder,1 GB,C:/Desktop/NewDirectory;';
      sze = 1;
     // destination ='changed the value ${sze.toString()}';
      print(dir);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListDemo(dir: dir, sze: 1, getLocationSource: widget.getLocationSource),
        ),
      );
    });
  }

  void dirArrayMaker() {
    int e = sze;
    int f = 4;
    dirArr = List.generate(e, (i) => List(f), growable: false);
    int i = 0;
    int j = 0;
    String tmp = "";
    for (int s = 0; s < dir.length; s++) {
      if (dir[s] == ',') {
        dirArr[i][j] = tmp;
        tmp = "";
        j++;
      } else if (dir[s] == ';') {
        dirArr[i][j] = tmp;
        tmp = "";
        j = 0;
        i++;
      } else
        tmp = tmp + dir[s];
    }
  }


  Widget build(BuildContext context) {
    dir = widget.dir;
    sze = widget.sze;
    dirArrayMaker();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("File System"),
        backgroundColor: Color(0xFF6200EE),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          (LocFile=='empty'&&LocDir=='empty')?Container():Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color:  (Colors.transparent ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // if you need this
                side: BorderSide(
                  width: 1,
                  color: Colors.transparent,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    (LocFile!='empty')?Text('Selected File'):Container(),
                    (LocDir!='empty')?Text('Selected Folder'):Container(),
                    (LocFile!='empty')?Card(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // if you need this
                            side: BorderSide(
                              width: 1,
                              color: Colors.transparent,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                    Center(
                                      child: Container(
                                        color: Colors.transparent ,
                                        padding: EdgeInsets.all(1.0),
                                        child: (LocFile=='empty')?Text('${LocDir} ', textAlign: TextAlign.left,
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        ):Text('${LocFile} ', textAlign: TextAlign.left,
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Provider.of<FileLocation>(context,listen:false).reset(LocFile);
                                    //context.read<FileLocation>().reset(LocFile);
                                    String tempStr ='None String';
                                    tempStr = (Provider.of<FileLocation>(context,listen:false)).fileLocation;
                                    Provider.of<FileLocationController>(context,listen:false).reset(tempStr);
                                    //context.read<FileLocationController>().reset(tempStr);
                                    //print(tempStr);
                                  },
                                  icon: Icon(Icons.add, size: 18),
                                  label: Text("Return Location of this file"),
                                ),
                              ],
                            ),
                          ),
                        ):Card(
                      color:  (LocFile == 'empty' ? ((LocDir=='empty')?Colors.transparent:Colors.orange) : Colors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // if you need this
                        side: BorderSide(
                          width: 1,
                          color: Colors.transparent,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Center(
                              child: Container(
                                color: Colors.transparent ,
                                padding: EdgeInsets.all(1.0),
                                child: (LocFile=='empty')?Text('${LocDir} ', textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ):Text('${LocFile} ', textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Provider.of<FolderLocation>(context,listen:false).reset(LocDir);
                                //context.read<FileLocation>().reset(LocFile);
                                String tempStr ='None String';
                                tempStr = (Provider.of<FolderLocation>(context,listen:false)).folderLocation;
                                Provider.of<FolderLocationController>(context,listen:false).reset(tempStr);
                              },
                              icon: Icon(Icons.add, size: 18),
                              label: Text("Return Location of this Directory"),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                  getDirectory(LocDir);
                              },
                              icon: Icon(Icons.arrow_forward, size: 18),
                              label: Text("Move into this Directory"),
                            )

                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          //for (int i=0,a=dirArr[i][0],b=dirArr[i][1],c=dirArr[i][2],d=dirArr[i][3] ; (i< dir.length);i++,a=dirArr[i][0],b=dirArr[i][1],c=dirArr[i][2],d=dirArr[i][3])
          for (int i = 0; (i < sze); i++)
            ListTile(
              title: Text('${dirArr[i][0]}'),
              isThreeLine: true,
              subtitle:
                  Text('${dirArr[i][1]} \n${dirArr[i][2]} \n${dirArr[i][3]}'),
              leading: (dirArr[i][1] != 'folder')
                  ? Icon(Icons.file_copy)
                  : Icon(Icons.folder),
              selected: countToValue[i] ?? false,
              trailing: Checkbox(
                value: _selectedIndex == i,
                onChanged: (bool value) {
                  setState(() {
                    //countToValue[i] = value;
                    _selectedIndex = i;
                    LocFile = (dirArr[_selectedIndex][1]=='Folder')?('empty'):dirArr[_selectedIndex][3];
                    LocDir = (dirArr[_selectedIndex][1]!='Folder')?('empty'):dirArr[_selectedIndex][3];
                  });
                },
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Dashboard(),
                //   ),
                // );
              },
            ),
        ],
      ),
    );
  }

}
