import 'package:flutter/material.dart';
import 'package:lesson_5/screens/main/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "to do list",
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
