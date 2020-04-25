import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class TypewriterText extends StatelessWidget {
  final String text;

  TypewriterText(this.text);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<int>(
        duration: Duration(milliseconds: 800),
        delay: Duration(milliseconds: 900),
        tween: IntTween(begin: 0, end: text.length),
        builder: (context, child, textLength) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text.substring(0, textLength),
                  style: TextStyle(fontSize: 24)),
            ],
          );
        });
  }
}
