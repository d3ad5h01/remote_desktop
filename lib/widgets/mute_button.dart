import 'package:flutter/material.dart';
import 'dart:math';
import '../constants.dart';
import 'package:language_learning_ui/providers/volume_provider.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:provider/provider.dart';


class MuteButton extends StatefulWidget
{
  const MuteButton({Key key}) : super(key: key);

  @override
  State<MuteButton> createState() => _MuteButton();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MuteButton extends State<MuteButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
          OutlinedButton(
                onPressed: () {
                    setState(() {
                        if((context.watch<Volume>().ifMute)==false){
                            Provider.of<Sockett>(context,listen:false).mute();
                            Provider.of<Volume>(context,listen:false).setMute(true);
                        }
                        else
                        {
                            Provider.of<Sockett>(context,listen:false).mute();
                            Provider.of<Volume>(context,listen:false).setMute(false);
                        }
                    });
                },
                child: Icon(
                (context.watch<Volume>().ifMute==false)?Icons.volume_up:Icons.volume_off,
                color: Constants.cardColor8,
                size: 50.0,
              ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 1.0, color: Constants.fontColor),
                          ),
                        ),

       // Text('Volume : ${(context.watch<Volume>().volume).floor()}')
      ],
    );
  }
}
