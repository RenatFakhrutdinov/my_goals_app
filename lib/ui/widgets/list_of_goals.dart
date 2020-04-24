import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mygoalsapp/model/goal_item.dart';
import 'package:mygoalsapp/res/strings.dart';
import 'package:mygoalsapp/ui/widgets/icon_conainer.dart';

class ListOfGoals extends StatefulWidget {
  final List<GoalItem> goals;
  final Function deleteItem;
  final Function updateItem;

  const ListOfGoals({Key key, this.goals, this.deleteItem, this.updateItem})
      : super(key: key);

  @override
  _ListOfGoalsState createState() => _ListOfGoalsState();
}

class _ListOfGoalsState extends State<ListOfGoals> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.goals.length,
        itemBuilder: (context, index) {
          return Slidable(
            actionPane: SlidableStrechActionPane(),
            actions: _actions(widget.deleteItem, widget.updateItem),
            secondaryActions: _actions(widget.deleteItem, widget.updateItem)
                .reversed
                .toList(),
            child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
            ),
          );
        });
  }

  List<Widget> _actions(Function deleteItem, Function updateItem) {
    List<Widget> actions = <Widget>[
      IconSlideAction(
        caption: Strings.delete,
        foregroundColor: Colors.black,
        color: Colors.transparent,
        iconWidget: IconContainer(
            Icon(CupertinoIcons.delete_simple, color: Colors.red)),
        onTap: deleteItem,
      ),
      IconSlideAction(
        caption: Strings.update,
        color: Colors.transparent,
        foregroundColor: Colors.black,
        iconWidget:
            IconContainer(Icon(CupertinoIcons.pencil, color: Colors.black54)),
        onTap: () => updateItem,
      ),
    ];
    return actions;
  }
}
