import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/blocs/database_bloc/database_bloc_export.dart';
import 'package:mygoalsapp/blocs/page_switcher_bloc/page_switcher_bloc.dart';
import 'package:mygoalsapp/model/goal_item.dart';
import 'package:mygoalsapp/res/strings.dart';
import 'package:mygoalsapp/ui/widgets/icon_conainer.dart';
import 'package:mygoalsapp/utils/define_id.dart';
import 'package:toast/toast.dart';

class WriteGoalWidget extends StatefulWidget {
  final PageSwitcherBloc pageBloc;
  final DatabaseBloc databaseBloc;

  const WriteGoalWidget(
      {Key key, @required this.pageBloc, @required this.databaseBloc})
      : super(key: key);

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
                  onPressed: () =>
                      widget.pageBloc.add(PageSwitcherEvent.toMainScreen),
                )),
                Text(Strings.cancel)
              ],
            )),
            Expanded(
              child: Column(
                children: <Widget>[
                  IconContainer(
                    BlocBuilder(
                        bloc: widget.databaseBloc,
                        builder: (context, databaseState) {
                          return IconButton(
                              icon: Icon(Icons.add, color: Colors.red),
                              onPressed: () {
                                if (_titleController.text.isNotEmpty &&
                                    _descriptionController.text.isNotEmpty) {
                                  widget.databaseBloc.add(DatabaseAddEvent(
                                      GoalItem(
                                          defineId(databaseState),
                                          _titleController.text,
                                          _descriptionController.text,
                                          DateTime.now().toString())));
                                  widget.pageBloc
                                      .add(PageSwitcherEvent.toMainScreen);
                                } else
                                  Toast.show(Strings.fillAllFields, context,
                                      gravity: 1);
                              });
                        }),
                  ),
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
