import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0.0,
      backgroundColor: Colors.white70,
      onPressed: () {},
      child: Icon(Icons.add, color: Colors.blue[300]),
    );
  }
}
