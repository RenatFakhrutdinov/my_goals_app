import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final Function onTap;

  const FloatingActionButtonWidget({Key key, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0.0,
      backgroundColor: Colors.white,
      onPressed: onTap,
      child: Icon(Icons.add, color: Colors.black),
      shape: CircleBorder(side: BorderSide()),
    );
  }
}
