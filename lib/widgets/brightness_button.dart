import 'package:flutter/material.dart';
import 'dart:math';
import 'package:language_learning_ui/providers/brightness_provider.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:provider/provider.dart';


/// This is the stateful widget that the main application instantiates.

/// This is the private State class that goes with MyStatefulWidget.

class BrightnessButton extends StatefulWidget {
  const BrightnessButton({Key key}) : super(key: key);

  @override
  State<BrightnessButton> createState() => _BrightnessButton();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BrightnessButton extends State<BrightnessButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // IconButton(
        //   icon: (context.watch<Brightness>().brightness!=0) ?const Icon(Icons.brightness_low):const Icon(Icons.brightness_high),
        //   tooltip: 'Increase brightness by 10',
        //   onPressed: () {
        //     setState(() {
        //       if(context.watch<Brightness>().brightness!=0)
        //         Provider.of<Brightness>(context,listen:false).reset(0);
        //       else
        //         Provider.of<Brightness>(context,listen:false).reset(30);
        //     });
        //   },
        // ),
        Slider(
          value: context.watch<Brightness>().brightness,
          min: 0,
          max: 100,
          divisions: 10,
          activeColor: Colors.orange,
          label: (context.watch<Brightness>().brightness).round().toString(),
          onChanged: (double value) {
            setState(() {
              Provider.of<Brightness>(context,listen:false).reset(value);
              Provider.of<Sockett>(context,listen:false).brightness(value);
            });
          },
        ),
        Text('Brightness : ${(context.watch<Brightness>().brightness).floor()}')
      ],
    );
  }
}