import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mygoalsapp/database/database_helper.dart';
import 'package:mygoalsapp/model/goal_item.dart';
import 'package:sky_background/sky_background.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<GoalItem> list = [];
  @override
  void initState() {
    super.initState();
    DatabaseHelper.db
        .insert(GoalItem(Random().nextInt(9999), "test", "Test", "test"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        backgroundColor: Colors.white70,
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.blue[300]),
      ),
      body: SkyBackground(
          child: Center(
        child: FutureBuilder(
          future: DatabaseHelper.db.getGoals(),
          builder: (context, AsyncSnapshot<List<GoalItem>> snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            } else
              return CupertinoActivityIndicator();
          },
        ),
      )),
    );
  }
}
