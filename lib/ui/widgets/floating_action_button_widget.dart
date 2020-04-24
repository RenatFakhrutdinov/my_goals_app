import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final Function method;

  const FloatingActionButtonWidget({Key key,@required this.method}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0.0,
      backgroundColor: Colors.white70,
      onPressed: method,
      child: Icon(Icons.add, color: Colors.blue[300]),
    );
  }
}
