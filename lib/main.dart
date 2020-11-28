import 'package:flutter/material.dart';
import 'package:ltodo/home/page/home.page.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'L - TODO', home: HomePage());
  }
}
