import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class NoGoalsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PlayAnimation<double>(
        duration: Duration(milliseconds: 400),
        tween: Tween(begin: 0.0, end: 80.0),
        builder: (context, child, height) {
          return PlayAnimation<double>(
            duration: Duration(milliseconds: 1200),
            delay: Duration(milliseconds: 500),
            tween:
                Tween(begin: 2.0, end: MediaQuery.of(context).size.width - 32),
            builder: (context, child, width) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                width: width,
                height: height,
                child: TypewriterText("Добавьте цель"),
              );
            },
          );
        },
      ),
    );
  }
}

class TypewriterText extends StatelessWidget {
  final String text;

  TypewriterText(this.text);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<int>(
        duration: Duration(milliseconds: 800),
        delay: Duration(milliseconds: 800),
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
