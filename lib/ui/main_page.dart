import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mygoalsapp/res/strings.dart';
import 'package:mygoalsapp/ui/widgets/floating_action_button_widget.dart';
import 'package:sky_background/sky_background.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButtonWidget(
        method: () {},
      ),
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text(
            Strings.doubleBack,
            textAlign: TextAlign.center,
          ),
        ),
        child: SkyBackground(
            child: Center(
          child: Text("test"),
        )),
      ),
    );
  }
}
