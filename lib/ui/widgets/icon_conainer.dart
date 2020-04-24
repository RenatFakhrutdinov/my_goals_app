import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final Icon icon;

  const IconContainer(this.icon, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white54,
            border: Border.all()),
        child: icon);
  }
}
