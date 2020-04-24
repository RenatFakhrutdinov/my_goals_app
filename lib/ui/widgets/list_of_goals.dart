import 'package:flutter/material.dart';
import 'package:mygoalsapp/model/goal_item.dart';

class ListOfGoals extends StatefulWidget {
  final List<GoalItem> goals;

  const ListOfGoals({Key key, this.goals}) : super(key: key);

  @override
  _ListOfGoalsState createState() => _ListOfGoalsState();
}

class _ListOfGoalsState extends State<ListOfGoals> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.goals.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topCenter,
                    colors: [Colors.white, Colors.white54])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.goals[index].title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    widget.goals[index].description,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
