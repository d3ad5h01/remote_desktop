import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/pages/file_system.dart';
import 'package:language_learning_ui/pages/media_controller.dart';
import 'package:language_learning_ui/pages/mouse_keyboard.dart';
import 'package:language_learning_ui/pages/presentation.dart';
import 'package:language_learning_ui/providers/file_location_provider.dart';
import 'package:language_learning_ui/providers/keyboard_controller_provider.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:provider/provider.dart';
import 'package:language_learning_ui/providers/folder_location_provider.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';
import 'package:language_learning_ui/providers/folder_location_controller_provider.dart';

String destination;
const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "ExpandablePanel",
                          //style: Theme.of(context).textTheme.body2,
                        )),
                    collapsed: Text(
                      loremIpsum,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (var _ in Iterable.generate(5))
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                loremIpsum,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              )),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildImg(Color color, double height) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ));
    }

    buildCollapsed1() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Expandable",
                    //style: Theme.of(context).textTheme.body1,
                  ),
                ],
              ),
            ),
          ]);
    }

    buildCollapsed2() {
      return buildImg(Colors.lightGreenAccent, 150);
    }

    buildCollapsed3() {
      return Container();
    }

    buildExpanded1() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Expandable",
                    //style: Theme.of(context).textTheme.body1,
                  ),
                  Text(
                    "3 Expandable widgets",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ]);
    }

    buildExpanded2() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
              Expanded(child: buildImg(Colors.orange, 100)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: buildImg(Colors.lightBlue, 100)),
              Expanded(child: buildImg(Colors.cyan, 100)),
            ],
          ),
        ],
      );
    }

    buildExpanded3() {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              loremIpsum,
              softWrap: true,
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expandable(
                    collapsed: buildCollapsed1(),
                    expanded: buildExpanded1(),
                  ),
                  Expandable(
                    collapsed: buildCollapsed2(),
                    expanded: buildExpanded2(),
                  ),
                  Expandable(
                    collapsed: buildCollapsed3(),
                    expanded: buildExpanded3(),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Builder(
                        builder: (context) {
                          var controller =
                          ExpandableController.of(context, required: true);
                          return TextButton(
                            child: Text(
                              controller.expanded ? "COLLAPSE" : "EXPAND",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(color: Colors.deepPurple),
                            ),
                            onPressed: () {
                              controller.toggle();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class Card3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(label),
      );
    }

    buildList() {
      return Column(
        children: <Widget>[
          for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
        ],
      );
    }

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                    ),
                    header: Container(
                      color: Colors.indigoAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            ExpandableIcon(
                              theme: const ExpandableThemeData(
                                expandIcon: Icons.arrow_right,
                                collapseIcon: Icons.arrow_drop_down,
                                iconColor: Colors.white,
                                iconSize: 28.0,
                                iconRotationAngle: math.pi / 2,
                                iconPadding: EdgeInsets.only(right: 5),
                                hasIcon: false,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Items",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: buildList(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class CopyCard1 extends StatefulWidget {
  @override
  State<CopyCard1> createState() => _CopyCard1State();
}

class _CopyCard1State extends State<CopyCard1> {
  @override



  Widget build(BuildContext context) {
    destination = 'none';
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                  child: Container(
                color: Colors.indigoAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        child: Icon(Icons.file_copy,size: 40.0,color: Colors.white,),


                    )

                  ],
                ),
                ),
                ),
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Copy Files",
                          //style: Theme.of(context).textTheme.body2,
                        )),
                    collapsed: Text(
                      "Location of file and destination directory to copy files.",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Choose Location of file .",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          controller: context.watch<FileLocationController>().fileLocationController,
                          decoration: InputDecoration(
                            icon: IconButton(icon: new Icon(Icons.file_copy), onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FileSystem(),
                              ),
                            ); },),
                            //labelText: 'Label text',
                            labelStyle: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                            hintText: 'Input Location of file',
                            helperText: 'Click icon to select from directory',
                            suffixIcon: Icon(
                              Icons.check_circle,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Choose destination directory to copy file.",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          //initialValue: context.watch<FolderLocation>().folderLocation,
                          controller: context.watch<FolderLocationController>().folderLocationController,
                          //maxLength: 20,
                          decoration: InputDecoration(
                            icon: IconButton(icon: new Icon(Icons.folder), onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FileSystem(),
                              ),
                            ); },),
                            //Icon(Icons.folder),
                            //labelText: 'Label text',
                            labelStyle: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                            hintText: 'Input Destination',
                            helperText: 'Click icon to select from directory',
                            suffixIcon: Icon(
                              Icons.check_circle,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              //Navigator.pushNamed(context),
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Presentation(),
                              //   ),
                              // );
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                                padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                                //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                               ),
                            icon: Icon(Icons.file_copy, size: 20),
                            label: Text("Copy File"),
                          ),
                        )


                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CopyCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildImg(Color color, double height) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ));
    }

    buildCollapsed1() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Copy Files",
                    //style: Theme.of(context).textTheme.body1,
                  ),
                ],
              ),
            ),
          ]);
    }

    buildCollapsed2() {
      return  Container();
        //buildImg(Colors.lightGreenAccent, 150);
    }

    buildCollapsed3() {
      return Container();
    }

    buildExpanded1() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Copy Files",
                    //style: Theme.of(context).textTheme.body1,
                  ),
                  Text(
                    "Input the location of file and destination directory to copy files.",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ]);
    }

    buildExpanded2() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
              Expanded(child: buildImg(Colors.orange, 100)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: buildImg(Colors.lightBlue, 100)),
              Expanded(child: buildImg(Colors.cyan, 100)),
            ],
          ),
        ],
      );
    }

    buildExpanded3() {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              loremIpsum,
              softWrap: true,
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expandable(
                    collapsed: buildCollapsed1(),
                    expanded: buildExpanded1(),
                  ),
                  Expandable(
                    collapsed: buildCollapsed2(),
                    expanded: buildExpanded2(),
                  ),
                  Expandable(
                    collapsed: buildCollapsed3(),
                    expanded: buildExpanded3(),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Builder(
                        builder: (context) {
                          var controller =
                          ExpandableController.of(context, required: true);
                          return TextButton(
                            child: Text(
                              controller.expanded ? "COLLAPSE" : "EXPAND",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(color: Colors.deepPurple),
                            ),
                            onPressed: () {
                              controller.toggle();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}







/*Presentation*/

class PresentationControlCard extends StatefulWidget {
  @override
  State<PresentationControlCard> createState() => _PresentationControlCardState();
}

class _PresentationControlCardState extends State<PresentationControlCard> {
  @override


  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                  child: Container(
                    color: Colors.indigoAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Icon(Icons.slideshow,size: 40.0,color: Colors.white,),


                        )

                      ],
                    ),
                  ),
                ),
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Presentation",
                          //style: Theme.of(context).textTheme.body2,
                        )),
                    collapsed: Text(
                      "Location of presentaion file.",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Choose Location of file .",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          controller: context.watch<FileLocationController>().fileLocationController,
                          decoration: InputDecoration(
                            icon: IconButton(icon: new Icon(Icons.file_copy), onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FileSystem(),
                              ),
                            ); },),
                            //labelText: 'Label text',
                            labelStyle: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                            hintText: 'Input Location of file',
                            helperText: 'Click icon to select from directory',
                            suffixIcon: Icon(
                              Icons.check_circle,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              //Navigator.pushNamed(context),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PresentationController(),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                              //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                            ),
                            icon: Icon(Icons.slideshow, size: 20),
                            label: Text("Open Presentation"),
                          ),
                        )


                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

/**/


/*Media COntrol Card*/

class MediaControlCard extends StatefulWidget {
  @override
  State<MediaControlCard> createState() => _MediaControlCardState();
}

class _MediaControlCardState extends State<MediaControlCard> {
  @override


  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                  child: Container(
                    color: Colors.indigoAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Icon(Icons.multitrack_audio ,size: 40.0,color: Colors.white,),


                        )

                      ],
                    ),
                  ),
                ),
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "MediaControlCard",
                          //style: Theme.of(context).textTheme.body2,
                        )),
                    collapsed: Text(
                      "Location of Media file.",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Choose Location of file .",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          controller: context.watch<FileLocationController>().fileLocationController,
                          decoration: InputDecoration(
                            icon: IconButton(icon: new Icon(Icons.file_copy), onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FileSystem(),
                              ),
                            ); },),
                            //labelText: 'Label text',
                            labelStyle: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                            hintText: 'Input Location of file',
                            helperText: 'Click icon to select from directory',
                            suffixIcon: Icon(
                              Icons.check_circle,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              //Navigator.pushNamed(context),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  MediaController(),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                              //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                            ),
                            icon: Icon(Icons.multitrack_audio , size: 20),
                            label: Text("Open MediaControlCard"),
                          ),
                        )


                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

/**/

/*Mouse Keyboard*/
class MouseKeyboardCard extends StatefulWidget {
  @override
  State<MouseKeyboardCard> createState() => _MouseKeyboardCardState();
}

class _MouseKeyboardCardState extends State<MouseKeyboardCard> {
  @override


  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                  child: Container(
                    color: Colors.indigoAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Icon(Icons.mouse  ,size: 40.0,color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                ),
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Mouse and Keyboard Remote Access",
                          //style: Theme.of(context).textTheme.body2,
                        )),
                    collapsed: Text(
                      "Remote Mouse and Keyboard Controls.",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Click to access remote controls.",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              //Navigator.pushNamed(context),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  MouseKeyboard(),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                              //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                            ),
                            icon: Icon(Icons.mouse , size: 20),
                            label: Text("Access Controls"),
                          ),
                        )


                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
/**/





/*keyboard Crad */

class KeyboardCard extends StatefulWidget {
  @override
  State<KeyboardCard> createState() => _KeyboardCardState();
}

class _KeyboardCardState extends State<KeyboardCard> {
  @override



  Widget build(BuildContext context) {
    destination = 'none';
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Card(
            child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Keyboard Access',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            cursorColor: Theme.of(context).cursorColor,
                            controller: context.watch<KeyboardController>().keyboardController,
                            decoration: InputDecoration(
                              //labelText: 'Label text',
                              labelStyle: TextStyle(
                                color: Color(0xFF6200EE),
                              ),
                              hintText: 'Input as keyboard',
                              suffixIcon: Icon(
                                Icons.keyboard,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                String _text = Provider.of<KeyboardController>(context,listen:false).text();
                                Provider.of<KeyboardController>(context,listen:false).reset('');
                                Provider.of<Sockett>(context,listen:false).keyboard(_text);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Send',style: TextStyle(fontSize: 25),),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10,top:10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
