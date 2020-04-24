import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/database_bloc/database_bloc_export.dart';
import 'blocs/simple_bloc_delegate.dart';
import 'ui/main_page.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DatabaseBloc>(
            create: (context) => DatabaseBloc()..add(DatabaseLoadEvent())),
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
