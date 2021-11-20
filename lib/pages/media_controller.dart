import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/widgets/expansion_tile_card_demo.dart';
import 'package:language_learning_ui/widgets/volume_button.dart';
import 'package:language_learning_ui/widgets/mute_button.dart';
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
          icon: Icon(Icons.arrow_back, color: Colors.white,size:40),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //title: Text("Media Controller"),
       elevation: 0,
        backgroundColor: Constants.fontColor2,
        centerTitle: true,
      ),

      body: Container(
        decoration: new BoxDecoration(
          color: Constants.fontColor2,
        ),
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child:  Image.asset("assets/images/netflixColored.png",height:200, width:200),
            ),
             SizedBox(height: 20),

            //Center(child: Text('Selected Media file: ${context.watch<FileLocation>().fileLocation}')),
            //SizedBox(height: 20),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: MuteButton(),
            // ),
            SizedBox(height: 20),

            //Center(child: Text('Selected Media file: ${context.watch<FileLocation>().fileLocation}')),
            //SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VolumeButton(cur: Constants.fontColor3),
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

                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/icons8-replay34.png",height:50, width:50),
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
                          color: Constants.fontColor3,
                          size: 60.0,
                        ),
                        onPressed: () {
                          setState(() {
                            Provider.of<Sockett>(context,listen:false).media("pp");
                            (_play == 0) ? _play = 1 : _play = 0;
                          });
                        },
                         style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 1.0, color: Constants.fontColor3),
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

                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/icons8-forward34.png",height:50, width:50),
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
                      padding: const EdgeInsets.all(10.0),
                      child: OutlinedButton(
                        child:Text('Skip Intro',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Constants.fontColor3,
                            fontWeight: FontWeight.w600,
                          ),),
                        onPressed: () {
                          setState(() {
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1.0, color: Constants.fontColor3),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: OutlinedButton(
                        child:Text('Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Constants.fontColor3,
                            fontWeight: FontWeight.w600,
                          ),),
                        onPressed: () {
                          setState(() {
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1.0, color: Constants.fontColor3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),),
    );
  }

}
