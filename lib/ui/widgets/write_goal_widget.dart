import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mygoalsapp/res/strings.dart';
import 'package:mygoalsapp/ui/widgets/icon_conainer.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
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
            children: <Widget>[
              TextField(
                controller: _titleController,
                maxLength: 32,
                decoration: InputDecoration(
                    labelText: Strings.title,
                    labelStyle: TextStyle(color: Colors.black45),
                    counter: SizedBox.shrink(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    labelText: Strings.description,
                    labelStyle: TextStyle(color: Colors.black45),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                maxLines: 6,
                minLines: 1,
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Column(
              children: <Widget>[
                IconContainer(IconButton(
                  icon: Icon(
                    CupertinoIcons.back,
                    color: Colors.black,
                  ),
                  onPressed: null,
                )),
                Text(Strings.cancel)
              ],
            )),
            Expanded(
              child: Column(
                children: <Widget>[
                  IconContainer(IconButton(
                      icon: Icon(Icons.add, color: Colors.red),
                      onPressed: null)),
                  Text(Strings.add)
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
