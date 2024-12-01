import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';
import 'package:lesson_5/data/model/task_model.dart';
import 'package:lesson_5/data/model/task_priority.dart';
import 'package:lesson_5/data/model/task_status.dart';
import 'package:lesson_5/screens/home/widgets/header.dart';
import 'package:lesson_5/screens/home/widgets/home_app_bar.dart';
import 'package:lesson_5/screens/home/widgets/progress.dart';
import 'package:lesson_5/screens/home/widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final tasks = <TaskModel>[
    TaskModel(
      id: 1,
      name: 'Mobile App Research',
      description: 'Mobile App Research',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now(),
      taskPriority: TaskPriority.high,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: 2,
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Main Flow',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now(),
      taskPriority: TaskPriority.medium,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: 3,
      name: 'Prepare Screens',
      description: 'Prepare Screens',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now(),
      taskPriority: TaskPriority.low,
      taskStatus: TaskStatus.incomplete,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hex020206,
      appBar: HomeAppBar(
        onSearchChanged: (value) {
          debugPrint("Search text changed: $value");
        },
      ),
      body: Column(
        children: [
          const Header(title: "Progress"),
          const Progress(
            numberOfTask: 3,
            numberOfCompleteTask: 2,
          ),
          const Header(title: "Today's Task"),
          Column(
            children: tasks
                .map(
                  (taskModel) => TaskItem(
                    taskModel: taskModel,
                    onStatusChanged: (taskStatus) {
                      final index = tasks.indexWhere(
                        (e) => e.id == taskModel.id,
                      );
                      setState(() {
                        tasks[index] = taskModel.copyWith(
                          taskStatus: taskStatus,
                        );
                      });
                    },
                  ),
                )
                .toList(),
          ),
          const Header(title: 'Tomorrow Task'),
        ],
      ),
    );
  }
}
