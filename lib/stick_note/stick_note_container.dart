import 'package:flutter/material.dart';
import 'package:flutter_my_note/view/pages/stick_note.dart';

class StickyNoteContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            SizedBox(
              width: 200,
              height: 300,
              child: Container(
                color: Colors.white,
                child: StickyNote(),
              ),
            ),
            const SizedBox(height: 100),
            SizedBox(
              width: 300,
              height: 300,
              child: Container(
                color: Colors.white,
                child: StickyNote(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
