import 'package:flutter/material.dart';
import 'package:ltodo/shared/model/task.dart';

class TaskComponent extends StatelessWidget {
  final Task task;
  final onDelete;

  TaskComponent(this.task, this.onDelete);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Theme.of(context).primaryColor, spreadRadius: 2)
        ],
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            task.title,
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          IconButton(
            alignment: AlignmentDirectional.centerEnd,
            icon: Icon(Icons.delete),
            tooltip: 'remove task',
            onPressed: () => onDelete(task.id),
          ),
        ],
      ),
    );
  }
}
