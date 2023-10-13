import 'package:flutter/material.dart';
import 'package:flutter_my_note/stick_note/stick_note_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StickyNoteContainer(),
    );
  }
}
