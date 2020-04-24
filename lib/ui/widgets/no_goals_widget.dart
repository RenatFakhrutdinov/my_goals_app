import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mygoalsapp/res/strings.dart';
import 'package:mygoalsapp/ui/widgets/typewriter_text.dart';
import 'package:simple_animations/simple_animations.dart';

class NoGoalsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment(0.0, -0.5),
          child: PlayAnimation<double>(
            duration: Duration(milliseconds: 400),
            tween: Tween(begin: 0.0, end: 80.0),
            builder: (context, child, height) {
              return PlayAnimation<double>(
                duration: Duration(milliseconds: 1200),
                delay: Duration(milliseconds: 500),
                tween: Tween(
                    begin: 2.0, end: MediaQuery.of(context).size.width - 32),
                builder: (context, child, width) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topCenter,
                          colors: [Colors.white, Colors.white54]),
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    width: width,
                    height: height,
                    child: TypewriterText(Strings.addGoal),
                  );
                },
              );
            },
          ),
        ),
        Align(
          alignment: Alignment(0.0, 0.5),
          child: PlayAnimation<double>(
              duration: Duration(seconds: 3),
              delay: Duration(milliseconds: 1500),
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (context, child, opacity) {
                return Opacity(
                    opacity: opacity,
                    child: Stack(
                      children: <Widget>[
                        Lottie.asset("assets/circular_click.json"),
                      ],
                    ));
              }),
        )
      ],
    );
  }
}
