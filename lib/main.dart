import 'package:flutter/material.dart';
import 'screens/todo_list_page.dart';

void main() => runApp(TodoListApp());

class TodoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: TodoListScreen(),
    );
  }
}