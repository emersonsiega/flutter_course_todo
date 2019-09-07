import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final bool completed;
  final String description;
  final Function toggleComplete;
  final Function onChangeDescription;

  Task({
    Key key,
    this.completed: false,
    this.description: '',
    @required this.toggleComplete,
    @required this.onChangeDescription,
  }) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.description);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              iconSize: 30,
              icon: Icon(
                widget.completed
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: widget.toggleComplete,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "O que deve ser feito?",
              ),
              style: TextStyle(
                color: widget.completed ? Colors.grey : Colors.white,
              ),
              maxLines: 1,
              enabled: !widget.completed,
              onChanged: widget.onChangeDescription,
              keyboardAppearance: Brightness.dark,
            ),
          ),
        ],
      ),
    );
  }
}
