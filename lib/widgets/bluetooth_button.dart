import 'package:flutter/material.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:provider/provider.dart';


double _bluetooth = 0.0;

/// This is the stateful widget that the main application instantiates.
class BluetoothButton extends StatefulWidget {
  const BluetoothButton({Key key}) : super(key: key);

  @override
  State<BluetoothButton> createState() => _BluetoothButton();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BluetoothButton extends State<BluetoothButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: (_bluetooth!=0) ?const Icon(Icons.bluetooth):const Icon(Icons.bluetooth_disabled),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {
              if(_bluetooth!=0) {
                _bluetooth = 0;
                Provider.of<Sockett>(context,listen:false).bluetooth("off");
              }
              else {
                _bluetooth = 1;
                Provider.of<Sockett>(context,listen:false).bluetooth("on");
              }
            });
          },
        ),
        // Text('Volume : $_')
      ],
    );
  }
}

