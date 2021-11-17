import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/widgets/expansion_tile_card_demo.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import 'package:language_learning_ui/providers/file_location_provider.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:language_learning_ui/providers/folder_location_provider.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';
import 'package:language_learning_ui/providers/folder_location_controller_provider.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';


class PresentationController extends StatelessWidget {
  const PresentationController({Key key}) : super(key: key);

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
        title: Text("Presentation Control"),
        elevation: 0,
        backgroundColor: Colors.white,
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
                Icons.slideshow ,
                color: Colors.black,
                size: 100.0,
              ),
            ),
            SizedBox(height: 20),

            //Center(child: Text('Selected Powerpoint File: ${context.watch<FileLocation>().fileLocation}')),
            SizedBox(height: 20),
            Container(
              child: Row(

                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            Provider.of<Sockett>(context,listen:false).presentation("f5");
                          });
                        },
                        child: Icon(
                          Icons.play_circle_outline,
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
                        onPressed: () {
                          setState(() {
                            Provider.of<Sockett>(context,listen:false).presentation("esc");
                          });
                        },
                        child: Icon(
                          Icons.close,
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
            Container(
              child: Row(

                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            Provider.of<Sockett>(context,listen:false).presentation("up");
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
                        onPressed: () {
                          setState(() {
                            Provider.of<Sockett>(context,listen:false).presentation("down");
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
          ],
        ),
      ),
    );
  }

}
