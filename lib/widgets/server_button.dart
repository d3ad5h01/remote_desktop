import 'package:flutter/material.dart';


double _wifi = 0.0;

/// This is the stateful widget that the main application instantiates.
class ServerButton extends StatefulWidget {
  const ServerButton({Key key}) : super(key: key);

  @override
  State<ServerButton> createState() => _ServerButton();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ServerButton extends State<ServerButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: (_wifi!=0) ?const Icon(Icons.desktop_mac):const Icon(Icons.desktop_access_disabled),
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

