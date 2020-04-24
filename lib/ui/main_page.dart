import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/blocs/database_bloc/database_bloc_export.dart';
import 'package:mygoalsapp/res/strings.dart';
import 'package:mygoalsapp/ui/widgets/floating_action_button_widget.dart';
import 'package:sky_background/sky_background.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DatabaseBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<DatabaseBloc>(context);
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
