import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ltodo/core/page/home.page.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'L - TODO',
      theme: ThemeData(
        primaryColor: Colors.brown[700],
        accentColor: Colors.brown[900],
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(fontFamily: 'NerkoOne'),
              bodyText1: TextStyle(fontFamily: 'AmaticSC'),
              bodyText2: TextStyle(fontFamily: 'AmaticSC'),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'NerkoOne', fontSize: 30, color: Colors.white),
              ),
        ),
      ),
      home: HomePage(),
    );
  }
}
