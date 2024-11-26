import 'package:flutter/material.dart';
import 'package:lesson_5/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "list",
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
