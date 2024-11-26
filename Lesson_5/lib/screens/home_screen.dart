import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';
import 'package:lesson_5/screens/home/widgets/header.dart';
import 'package:lesson_5/screens/home/widgets/progress.dart';
import 'package:lesson_5/screens/home/widgets/today_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.hex020206,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Header(title: "Progress"),
          Progress(),
          Header(title: "Today's Task"),
          TodayTask(
            colors: AppColors.hexFACBBA,
            title: "Mobile App Research",
            choose: true,
            date: "4 Oct",
          ),
          TodayTask(
            colors: AppColors.hexD7F0FF,
            title: "Prepare Wireframe for Main Flow",
            choose: true,
            date: "4 Oct",
          ),
          TodayTask(
            colors: AppColors.hexFAD9FF,
            title: "Prepare Screens",
            choose: false,
            date: "4 Oct",
          ),
        ],
      ),
    );
  }
}
