import 'package:flutter/material.dart';
import 'package:ltodo/home/model/task.dart';

class TaskComponent extends StatelessWidget {
  final Task task;
  TaskComponent(this.task);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (bool value) {},
        ),
        Text(
          task.titulo,
          style: TextStyle(fontSize: 28, fontFamily: 'Courier New'),
          textAlign: TextAlign.center,
        ),
        IconButton(
          alignment: AlignmentDirectional.centerEnd,
          icon: Icon(Icons.delete),
          tooltip: 'remove task',
          onPressed: () => null,
        ),
      ],
    );
  }
}
