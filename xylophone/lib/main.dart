import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
  }
Expanded keyBuild(Color col,int soundNumber){
  return Expanded(
    child: FlatButton(
      color: col,
      onPressed: () {
        playSound(soundNumber);
      },
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              keyBuild(Colors.red,1),
              keyBuild(Colors.green,2),
              keyBuild(Colors.yellow,3),
              keyBuild(Colors.blue,4),
              keyBuild(Colors.orange,5),
              keyBuild(Colors.teal,6),
              keyBuild(Colors.pink,7),
            ],
          ),
        ),
      ),
    );
  }
}
