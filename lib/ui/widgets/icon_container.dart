import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final Widget icon;
  final bool isSlidable;

  const IconContainer(this.icon, {this.isSlidable = true, Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: isSlidable ? 40 : 64,
        width: isSlidable ? 40 : 64,
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
