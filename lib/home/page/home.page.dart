import 'package:flutter/material.dart';
import 'package:ltodo/home/component/task-list.component.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'L - TODO',
        home: Scaffold(
          appBar: AppBar(
            title: Text('L - TODO'),
            centerTitle: true,
          ),
          body: TaskListComponent(),
        ));
  }
}
