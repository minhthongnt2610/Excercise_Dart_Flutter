import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';
import 'package:lesson_5/data/model/task_model.dart';
import 'package:lesson_5/data/model/task_priority.dart';
import 'package:lesson_5/data/model/task_status.dart';
import 'package:lesson_5/screens/home/create_new_task/create_new_task_screen.dart';
import 'package:lesson_5/screens/home/widgets/add_button.dart';
import 'package:lesson_5/screens/home/widgets/header.dart';
import 'package:lesson_5/screens/home/widgets/home_app_bar.dart';
import 'package:lesson_5/screens/home/widgets/progress.dart';

import 'home/widgets/search_field.dart';
import 'home/widgets/task_item.dart';

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
    ),
    TaskModel(
      id: 6,
      name: 'Website Research',
      description: 'Website Research',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now().add(const Duration(days: 1)),
      taskPriority: TaskPriority.high,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: 7,
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Main Flow',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now().add(const Duration(days: 1)),
      taskPriority: TaskPriority.high,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: 8,
      name: 'Prepare Screens',
      description: 'Prepare Screens',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now().add(const Duration(days: 1)),
      taskPriority: TaskPriority.high,
      taskStatus: TaskStatus.complete,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final todayTasks = tasks.where((task) {
      return DateUtils.isSameDay(
        task.date,
        DateTime.now(),
      );
    }).toList();
    final tomorrowTasks = tasks.where((task) {
      return DateUtils.isSameDay(
        task.date,
        DateTime.now().add(
          const Duration(days: 1),
        ),
      );
    }).toList();
    final numberOfCompletedTodayTask = todayTasks.where((task) {
      return task.taskStatus == TaskStatus.complete;
    }).length;
    return Scaffold(
      backgroundColor: AppColors.hex020206,
      appBar: HomeAppBar(
        onSearchChanged: (value) {
          debugPrint("Search text changed: $value");
        },
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    //vertical: 12,
                    horizontal: 20,
                  ),
                  child: SearchField(
                    hintText: "Search task here",
                    onChanged: (value) {
                      debugPrint("Search text changed: $value");
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Header(title: "Progress"),
                Progress(
                  numberOfTask: todayTasks.length,
                  numberOfCompleteTask: numberOfCompletedTodayTask,
                ),
                const Header(title: "Today's Task"),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TaskItem(
                      taskModel: todayTasks[index],
                      onStatusChanged: (taskStatus) {
                        final taskIndex = tasks.indexWhere(
                          (e) => e.id == todayTasks[index].id,
                        );
                        setState(() {
                          tasks[taskIndex] = todayTasks[index]
                              .copyWith(taskStatus: taskStatus);
                        });
                      },
                    );
                  },
                  itemCount: todayTasks.length,
                  shrinkWrap: true,
                ),
                const Header(title: "Tomorrow Task"),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TaskItem(
                      taskModel: tomorrowTasks[index],
                      onStatusChanged: (taskStatus) {
                        final tomorrowTaskIndex = tasks.indexWhere(
                          (e) => e.id == tomorrowTasks[index].id,
                        );
                        setState(() {
                          tasks[tomorrowTaskIndex] = tomorrowTasks[index]
                              .copyWith(taskStatus: taskStatus);
                        });
                      },
                    );
                  },
                  itemCount: todayTasks.length,
                  shrinkWrap: true,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: AddButton(onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const CreateNewTaskScreen();
            },
          ),
        );
      }),
    );
  }
}
