import 'package:flutter/material.dart';
import 'dart:math';
import 'package:language_learning_ui/providers/volume_provider.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:provider/provider.dart';


class VolumeButton extends StatefulWidget {
  const VolumeButton({Key key}) : super(key: key);

  @override
  State<VolumeButton> createState() => _VolumeButton();
}

/// This is the private State class that goes with MyStatefulWidget.
class _VolumeButton extends State<VolumeButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
      
        Slider(
          value: context.watch<Volume>().volume,
          min: 0,
          max: 100,
          divisions: 20,
          activeColor: Colors.orange,
          label: (context.watch<Volume>().volume).round().toString(),
          onChanged: (double value) {
            setState(() {
              Provider.of<Volume>(context,listen:false).reset(value);
              Provider.of<Sockett>(context,listen:false).volume(value);
            });
          },
        ),
       // Text('Volume : ${(context.watch<Volume>().volume).floor()}')
      ],
    );
  }
}
