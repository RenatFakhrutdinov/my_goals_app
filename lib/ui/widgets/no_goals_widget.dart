import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mygoalsapp/blocs/page_switcher_bloc/page_switcher_bloc_export.dart';
import 'package:mygoalsapp/res/strings.dart';
import 'package:mygoalsapp/ui/widgets/floating_action_button_widget.dart';
import 'package:mygoalsapp/ui/widgets/typewriter_text.dart';
import 'package:simple_animations/simple_animations.dart';

class NoGoalsWidget extends StatelessWidget {
  final PageSwitcherBloc pageBloc;

  const NoGoalsWidget({Key key, @required this.pageBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment(0.0, -0.5),
          child: PlayAnimation<double>(
            duration: Duration(milliseconds: 800),
            tween:
                Tween(begin: 2.0, end: MediaQuery.of(context).size.width - 32),
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
                height: 80,
                child: TypewriterText(Strings.addGoal),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment(0.0, 0.5),
          child: Container(
            height: 200,
            width: 200,
            child: PlayAnimation<double>(
                duration: Duration(milliseconds: 1500),
                delay: Duration(milliseconds: 1500),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, child, opacity) {
                  return Opacity(
                      opacity: opacity,
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: FloatingActionButtonWidget(
                              onTap: () {
                                pageBloc.add(PageSwitcherToAddingWidget());
                              },
                            ),
                          ),
                          IgnorePointer(
                            ignoring: true,
                            child: Center(
                              child: Lottie.asset("assets/click.json"),
                            ),
                          ),
                        ],
                      ));
                }),
          ),
        ),
      ],
    );
  }
}
