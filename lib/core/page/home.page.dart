import 'package:flutter/material.dart';
import 'package:ltodo/core/component/nav-drawer.component.dart';
import 'package:ltodo/task/task-form.component.dart';
import 'package:ltodo/task/task-list.component.dart';
import 'package:ltodo/task/task.component.dart';
import 'package:ltodo/shared/model/task.dart';
import 'dart:async';
import 'package:ltodo/shared/helper/data-base.helper.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper _database = new DatabaseHelper();

  List<Task> _tasks = [];

  _HomePageState() {
    _loadTasks();
  }

  Future<void> _insertTask(Task task) async {
    final Database db = await _database.instance;

    await db.insert(
      'task',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _loadTasks();
  }

  void _loadTasks() async {
    final Database db = await _database.instance;

    final List<Map<String, dynamic>> maps = await db.query('task');

    setState(() {
      _tasks = List.generate(maps.length, (i) {
        return Task(
          id: maps[i]['id'],
          title: maps[i]['title'],
          description: maps[i]['description'],
        );
      });
    });
  }

  Future<void> _updateTask(Task task) async {
    final Database db = await _database.instance;

    await db.update(
      'task',
      task.toMap(),
      where: "id = ?",
      whereArgs: [task.id],
    );
    _loadTasks();
  }

  Future<void> _deleteTask(int id) async {
    final Database db = await _database.instance;

    await db.delete(
      'task',
      where: "id = ?",
      whereArgs: [id],
    );
    _loadTasks();
  }

  _onTaskFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TaskForm(_insertTask);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('L - TODO'),
        centerTitle: true,
      ),
      body: TaskListComponent(
          _tasks.map((e) => TaskComponent(e, _deleteTask)).toList()),
      drawer: NavDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onTaskFormModal(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
