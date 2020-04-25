import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/database_bloc/database_bloc_export.dart';
import 'blocs/page_switcher_bloc/page_switcher_bloc_export.dart';
import 'blocs/simple_bloc_delegate.dart';
import 'ui/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DatabaseBloc>(
            create: (context) => DatabaseBloc()..add(DatabaseLoadEvent())),
        BlocProvider<PageSwitcherBloc>(create: (context) => PageSwitcherBloc())
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        home: MainPage(),
      ),
    );
  }
}
