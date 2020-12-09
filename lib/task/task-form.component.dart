import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltodo/shared/model/task.dart';

class TaskForm extends StatefulWidget {
  final insertTask;

  TaskForm(this.insertTask);

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  _onSubmit() {
    var title = this.titleController.text;
    var description = this.descriptionController.text;

    if (title.isEmpty || title == null) return;
    if (description.isEmpty || description == null) return;

    widget.insertTask(Task(title: title, description: description));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              autofocus: true,
              onSubmitted: (_) {
                _onSubmit();
                titleController.clear();
              },
              decoration: InputDecoration(labelText: 'Task'),
            ),
            TextField(
              controller: descriptionController,
              onSubmitted: (_) {
                _onSubmit();
                descriptionController.clear();
              },
              decoration: InputDecoration(labelText: 'Description'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: _onSubmit,
                  child: Text('Add Task'),
                  textColor: Colors.purple,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
