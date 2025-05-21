import 'package:flutter/material.dart';
import 'package:todo_application/screens/Todo_Screen.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: TodoScreen(),
    );
  }
}