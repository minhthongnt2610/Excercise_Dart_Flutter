import 'package:flutter/material.dart';
import 'package:lesson_5/screens/home/create_new_task/create_new_task_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "list",
      home: CreateNewTaskScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
