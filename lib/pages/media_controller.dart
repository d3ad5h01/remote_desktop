import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/widgets/expansion_tile_card_demo.dart';
import 'package:language_learning_ui/widgets/volume_button.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import 'package:language_learning_ui/providers/file_location_provider.dart';
import 'package:language_learning_ui/providers/folder_location_provider.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';
import 'package:language_learning_ui/providers/folder_location_controller_provider.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';

int _play = 0;

class MediaController extends StatelessWidget {
  final String media_location;
  const MediaController({Key key, this.media_location}) : super(key: key);

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
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Media Controller"),
        backgroundColor: Color(0xFF6200EE),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.audiotrack,
                color: Colors.black,
                size: 100.0,
              ),
            ),
            SizedBox(height: 20),

            Center(child: Text('Selected Media file: ${context.watch<FileLocation>().fileLocation}')),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VolumeButton(),
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
                            Provider.of<Sockett>(context,listen:false).media("prev");
                          });
                        },
                        child: Icon(
                          Icons.skip_previous,
                          color: Colors.black,
                          size: 60.0,
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
                        child: (_play!=0) ?const Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                          size: 60.0,
                        ):const Icon(
                          Icons.pause,
                          color: Colors.black,
                          size: 60.0,
                        ),
                        onPressed: () {
                          setState(() {
                            Provider.of<Sockett>(context,listen:false).media("pp");
                            (_play == 0) ? _play = 1 : _play = 0;
                          });
                        },
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
                            Provider.of<Sockett>(context,listen:false).media("next");
                          });
                        },
                        child: Icon(
                          Icons.skip_next,
                          color: Colors.black,
                          size: 60.0,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   child: Row(
            //
            //     children: <Widget>[
            //       Expanded(
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: OutlinedButton(
            //             onPressed: () {},
            //             child: Icon(
            //               Icons.arrow_back_ios,
            //               color: Colors.black,
            //               size: 40.0,
            //             ),
            //             style: ElevatedButton.styleFrom(
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(12), // <-- Radius
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: OutlinedButton(
            //             onPressed: () {},
            //             child: Icon(
            //               Icons.arrow_forward_ios,
            //               color: Colors.black,
            //               size: 40.0,
            //             ),
            //             style: ElevatedButton.styleFrom(
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(12), // <-- Radius
            //               ),
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

}
