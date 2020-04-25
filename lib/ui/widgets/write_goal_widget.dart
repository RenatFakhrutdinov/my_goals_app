import 'package:flutter/material.dart';

class WriteGoalWidget extends StatefulWidget {
  @override
  _WriteGoalWidgetState createState() => _WriteGoalWidgetState();
}

class _WriteGoalWidgetState extends State<WriteGoalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topCenter,
            colors: [Colors.white, Colors.white54]),
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Text('tete'),
    );
  }
}
