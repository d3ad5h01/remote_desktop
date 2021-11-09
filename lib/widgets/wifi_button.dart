import 'package:flutter/material.dart';


double _wifi = 0.0;

/// This is the stateful widget that the main application instantiates.
class WifiButton extends StatefulWidget {
  const WifiButton({Key key}) : super(key: key);

  @override
  State<WifiButton> createState() => _WifiButton();
}

/// This is the private State class that goes with MyStatefulWidget.
class _WifiButton extends State<WifiButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: (_wifi!=0) ?const Icon(Icons.wifi):const Icon(Icons.wifi_off),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {
              if(_wifi!=0)
                _wifi = 0;
              else
                _wifi =1;
            });
          },
        ),
        // Text('Volume : $_')
      ],
    );
  }
}

