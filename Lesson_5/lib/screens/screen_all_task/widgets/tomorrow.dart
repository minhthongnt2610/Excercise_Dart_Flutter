import 'package:flutter/material.dart';

import '../../../data/model/task_model.dart';
import '../../../data/model/task_priority.dart';
import '../../../data/model/task_status.dart';
import '../../home/widgets/task_item.dart';

class Tomorrow extends StatefulWidget {
  const Tomorrow({super.key});

  @override
  State<Tomorrow> createState() => _TomorrowState();
}

class _TomorrowState extends State<Tomorrow> {
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
    return Column(
      children: [
        ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return TaskItem(
              taskModel: tomorrowTasks[index],
              onStatusChanged: (taskStatus) {
                final taskIndex = tasks.indexWhere(
                  (e) => e.id == tomorrowTasks[index].id,
                );
                setState(() {
                  tasks[taskIndex] =
                      tomorrowTasks[index].copyWith(taskStatus: taskStatus);
                });
              },
            );
          },
          itemCount: tomorrowTasks.length,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
