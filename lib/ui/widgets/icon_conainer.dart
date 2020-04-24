import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final Icon icon;

  const IconContainer(this.icon, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: <Color>[
            Colors.white,
            Color.fromRGBO(255, 255, 255, 0.01)
          ]),
        ),
        child: icon);
  }
}
