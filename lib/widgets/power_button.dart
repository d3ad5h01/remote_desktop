import 'package:flutter/material.dart';


double _power = 0.0;
String tex = "Power On";
/// This is the stateful widget that the main application instantiates.
class PowerButton extends StatefulWidget {
  const PowerButton({Key key}) : super(key: key);

  @override
  State<PowerButton> createState() => _PowerButton();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PowerButton extends State<PowerButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: (_power!=0) ?const Icon(Icons.settings_power):const Icon(Icons.settings_power),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {
                if(_power!=0){
                _power = 0;
                tex = "Power Off";
                }
                else {
                  _power = 1;
                tex = "Power On";
                }
            });
          },
        ),
         Text(' $tex ')
      ],
    );
  }
}

