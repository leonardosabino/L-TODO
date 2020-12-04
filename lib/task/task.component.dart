import 'package:flutter/material.dart';
import 'package:ltodo/shared/model/task.dart';

class TaskComponent extends StatelessWidget {
  final Task task;
  final onDelete;

  TaskComponent(this.task, this.onDelete);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (bool value) {},
        ),
        Text(
          task.id.toString(),
          style: TextStyle(fontSize: 28, fontFamily: 'Courier New'),
          textAlign: TextAlign.center,
        ),
        IconButton(
          alignment: AlignmentDirectional.centerEnd,
          icon: Icon(Icons.delete),
          tooltip: 'remove task',
          onPressed: () => onDelete(task.id),
        ),
      ],
    );
  }
}
