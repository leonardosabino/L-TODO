import 'package:flutter/material.dart';
import 'package:ltodo/home/component/task-list.component.dart';
import 'package:ltodo/home/component/nav-drawer.component.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Colors.blueGrey[800],

          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
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
          body: TaskListComponent(),
        ));
  }
}
