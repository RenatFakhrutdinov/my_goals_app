import 'package:flutter/material.dart';
import 'package:mygoalsapp/res/strings.dart';

class WriteGoalWidget extends StatefulWidget {
  @override
  _WriteGoalWidgetState createState() => _WriteGoalWidgetState();
}

class _WriteGoalWidgetState extends State<WriteGoalWidget> {
  TextEditingController _titleController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: '');
    _descriptionController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topCenter,
            colors: [Colors.white, Colors.white54]),
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _titleController,
            maxLength: 32,
            decoration: InputDecoration(labelText: Strings.title),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: Strings.description),
            maxLines: 6,
            minLines: 1,
          ),
        ],
      ),
    );
  }
}
