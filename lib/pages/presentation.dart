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
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';

class Presentation extends StatelessWidget {
  final String presentation_location;
  const Presentation({Key key, this.presentation_location}) : super(key: key);

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
        title: Text("Presentation Control"),
        backgroundColor: Color(0xFF6200EE),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Center(child: Text('Selected Presentation: ${context.watch<FileLocation>().fileLocation}')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Start SLideshow'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Stop Slideshow'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
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
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Previous'),
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
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Next'),
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
    )
          ],
        ),
      ),
    );
  }

}
