import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int trackNo) {
    final player = AudioCache();
    player.play('note$trackNo.wav');
  }

  Expanded reduceKey({Color color, int trackNo}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(trackNo);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('XyloPhone'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              reduceKey(color: Colors.red, trackNo: 1),
              reduceKey(color: Colors.orange, trackNo: 2),
              reduceKey(color: Colors.yellow, trackNo: 3),
              reduceKey(color: Colors.green, trackNo: 4),
              reduceKey(color: Colors.teal, trackNo: 5),
              reduceKey(color: Colors.blue, trackNo: 6),
              reduceKey(color: Colors.purple, trackNo: 7),
            ],
          ),
        ),
      ),
    );
  }
}
