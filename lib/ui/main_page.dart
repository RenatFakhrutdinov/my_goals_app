import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/blocs/database_bloc/database_bloc_export.dart';
import 'package:mygoalsapp/blocs/page_switcher_bloc/page_switcher_bloc.dart';
import 'package:mygoalsapp/res/strings.dart';
import 'package:mygoalsapp/ui/widgets/floating_action_button_widget.dart';
import 'package:mygoalsapp/ui/widgets/list_of_goals.dart';
import 'package:mygoalsapp/ui/widgets/no_goals_widget.dart';
import 'package:sky_background/sky_background.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DatabaseBloc _databaseBloc;
  PageSwitcherBloc _pageSwitcherBloc;
  @override
  void initState() {
    super.initState();
    _databaseBloc = BlocProvider.of<DatabaseBloc>(context);
    _pageSwitcherBloc = BlocProvider.of<PageSwitcherBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder(
          bloc: _databaseBloc,
          builder: (context, state) {
            if (state is DatabaseLoadedState && state.goals.isNotEmpty) {
              return FloatingActionButtonWidget(
                onTap: () {},
              );
            } else
              return SizedBox.shrink();
          }),
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text(
            Strings.doubleBack,
            textAlign: TextAlign.center,
          ),
        ),
        child: SkyBackground(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder(
                bloc: _databaseBloc,
                builder: (context, databaseState) {
                  if (databaseState is DatabaseLoadedState) {
                    /// navigation controls by PageSwitchBloc
                    return BlocBuilder(
                        bloc: _pageSwitcherBloc,
                        builder: (context, pageState) {
                          if (pageState == PageSwitcherState.onMainScreen) {
                            return _goals(databaseState);
                          } else if (pageState ==
                              PageSwitcherState.onAddingGoalScreen) {
                            return Center(
                              child: Text('test'),
                            );
                          } else
                            return Center(
                              child: Text('animation'),
                            );
                        });
                  } else if (databaseState is DatabaseErrorState) {
                    return Center(
                      child: Text(Strings.errorMessage),
                    );
                  } else
                    return Center(
                      child: CupertinoActivityIndicator(),
                    );
                }),
          ),
        ),
      ),
    );
  }

  Widget _goals(DatabaseLoadedState state) {
    if (state.goals.isEmpty) {
      return NoGoalsWidget(pageBloc: _pageSwitcherBloc);
    } else
      return ListOfGoals(goals: state.goals, bloc: _databaseBloc);
  }
}
