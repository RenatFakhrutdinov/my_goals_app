import 'package:flutter/material.dart';
import 'package:sky_background/sky_background.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
        child: Text('test'),
      )),
    );
  }
}
