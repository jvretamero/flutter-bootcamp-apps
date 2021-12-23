import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            7,
            (index) => NoteButton(note: index + 1),
          ),
        ),
      ),
    );
  }
}

class NoteButton extends StatelessWidget {
  final int note;
  final AudioCache audio = AudioCache();

  String get _fileName => 'note$note.wav';

  NoteButton({
    Key? key,
    required this.note,
  }) : super(key: key) {
    audio.load(_fileName);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: () {
          audio.play(_fileName);
        },
        fillColor: Colors.primaries[(note - 1) * 2],
      ),
    );
  }
}
