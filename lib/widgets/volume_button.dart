import 'package:flutter/material.dart';
import 'dart:math';
import 'package:language_learning_ui/providers/volume_provider.dart';
import 'package:provider/provider.dart';

// double _volume = 0.0;
//context.watch<Volume>().volume,
/// This is the stateful widget that the main application instantiates.
// class MuteButton extends StatefulWidget {
//   const MuteButton({Key key}) : super(key: key);
//
//   @override
//   State<MuteButton> createState() => _MuteButton();
// }

/// This is the private State class that goes with MyStatefulWidget.
// class _MuteButton extends State<MuteButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         IconButton(
//           icon: (context.watch<Volume>().volume!=0) ?const Icon(Icons.volume_up):const Icon(Icons.volume_off),
//           tooltip: 'Increase volume by 10',
//           onPressed: () {
//             setState(() {
//               if(_volume!=0)
//                   _volume = 0;
//               else
//                   _volume =30;
//             });
//           },
//         ),
//         Slider(
//           value: _volume,
//           min: 0,
//           max: 200,
//           divisions: 20,
//           activeColor: Colors.orange,
//           label: _volume.round().toString(),
//           onChanged: (double value) {
//             setState(() {
//               _volume = value;
//             });
//           },
//         ),
//         Text('Volume : $_volume')
//       ],
//     );
//   }
// }
//

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
        IconButton(
          icon: (context.watch<Volume>().volume!=0) ?const Icon(Icons.volume_up):const Icon(Icons.volume_off),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {
              if(context.watch<Volume>().volume!=0)
                Provider.of<Volume>(context,listen:false).reset(0);
              else
                Provider.of<Volume>(context,listen:false).reset(30);
            });
          },
        ),
        Slider(
          value: context.watch<Volume>().volume,
          min: 0,
          max: 200,
          divisions: 20,
          activeColor: Colors.orange,
          label: (context.watch<Volume>().volume).round().toString(),
          onChanged: (double value) {
            setState(() {
              Provider.of<Volume>(context,listen:false).reset(value);
            });
          },
        ),
        Text('Volume : ${(context.watch<Volume>().volume).floor()}')
      ],
    );
  }
}
