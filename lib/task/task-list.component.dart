import 'package:flutter/material.dart';

class TaskListComponent extends StatefulWidget {
  final List<Widget> widgets;

  TaskListComponent(this.widgets);

  @override
  _TaskListComponentState createState() => _TaskListComponentState();
}

class _TaskListComponentState extends State<TaskListComponent> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...widget.widgets],
    );
  }
}
