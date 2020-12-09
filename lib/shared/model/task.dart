import 'package:flutter/material.dart';

class Task {
  int id;
  String title;
  String description;

  Task({this.id, @required this.title, @required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $title, age: $description}';
  }
}
