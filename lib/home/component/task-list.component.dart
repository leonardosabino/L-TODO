import 'package:flutter/material.dart';
import 'package:ltodo/home/component/task.component.dart';
import 'package:ltodo/home/model/task.dart';

class TaskListComponent extends StatefulWidget {
  @override
  _TaskListComponentState createState() => _TaskListComponentState();
}

class _TaskListComponentState extends State<TaskListComponent> {
  List<Widget> widgets = [
    Task(id: 'aaa', titulo: 'task1', descricao: 'descricao task 1'),
    Task(id: 'aaa', titulo: 'task2', descricao: 'descricao task 2')
  ].map((task) => TaskComponent(task)).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...widgets],
    );
  }
}
