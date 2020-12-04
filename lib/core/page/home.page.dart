import 'package:flutter/material.dart';
import 'package:ltodo/task/task-list.component.dart';
import 'package:ltodo/home/component/nav-drawer.component.dart';
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
    loadTasks();
  }

  Future<void> insertTask(Task task) async {
    final Database db = await _database.instance;

    await db.insert(
      'task',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    loadTasks();
  }

  void loadTasks() async {
    final Database db = await _database.instance;

    final List<Map<String, dynamic>> maps = await db.query('task');

    setState(() {
      _tasks = List.generate(maps.length, (i) {
        return Task(
          id: maps[i]['id'],
          titulo: maps[i]['titulo'],
          descricao: maps[i]['descricao'],
        );
      });
    });
  }

  Future<void> updateTask(Task task) async {
    final Database db = await _database.instance;

    await db.update(
      'task',
      task.toMap(),
      where: "id = ?",
      whereArgs: [task.id],
    );
    loadTasks();
  }

  Future<void> deleteTask(int id) async {
    final Database db = await _database.instance;

    await db.delete(
      'task',
      where: "id = ?",
      whereArgs: [id],
    );
    loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blueGrey[800],
          fontFamily: 'Georgia',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        title: 'L - TODO',
        home: Scaffold(
          drawer: NavDrawer(),
          appBar: AppBar(
            title: Text('L - TODO'),
            centerTitle: true,
          ),
          body: TaskListComponent(
              _tasks.map((e) => TaskComponent(e, deleteTask)).toList()),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              insertTask(
                Task(
                    id: DateTime.now().hashCode,
                    titulo: 'AAAAAAAAAAAAAAAA',
                    descricao: 'descricao task 1'),
              );
            },
            child: Icon(Icons.plus_one),
            backgroundColor: Colors.blueGrey,
          ),
        ));
  }
}
