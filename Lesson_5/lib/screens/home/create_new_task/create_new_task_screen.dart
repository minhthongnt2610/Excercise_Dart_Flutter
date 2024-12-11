import 'package:flutter/material.dart';
import 'package:lesson_5/common_widgets/primary_app_bar.dart';
import 'package:lesson_5/constants/app_colors.dart';
import 'package:lesson_5/data/model/task_priority.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/header_new_task.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/input_text_filed.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/priority_item.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/set_date.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/set_time.dart';
import 'package:lesson_5/screens/home_screen.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_icons.dart';

class CreateNewTaskScreen extends StatefulWidget {
  const CreateNewTaskScreen({super.key});

  @override
  State<CreateNewTaskScreen> createState() => _createNewTaskScreen();
}

class _createNewTaskScreen extends State<CreateNewTaskScreen> {
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  TaskPriority? selectedTaskPriority;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Create new task',
        onBack: () {
          Navigator.of(context).pop(
            MaterialPageRoute(
              builder: (context) {
                return const HomeScreen();
              },
            ),
          );
        },
      ),
      backgroundColor: AppColors.hex020206,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SetDate(
              date: DateTime.now(),
              selectedDate: DateTime.now(),
              onDateChanged: (date) {},
            ),
            const HeaderNewTask(
              title: 'Schedule',
              opacity: 1,
              fontSize: 22,
            ),
            const InputTextFiled(hint: 'Name', maxLines: 1),
            const InputTextFiled(hint: 'Description', maxLines: 3),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SetTime(
                      title: "Start Time",
                      onChanged: (time) {
                        setState(() {
                          startTime = time;
                        });
                      },
                      time: startTime ?? TimeOfDay.now(),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SetTime(
                      title: "End Time",
                      onChanged: (time) {
                        setState(() {
                          endTime = time;
                        });
                      },
                      time: endTime ?? TimeOfDay.now(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const HeaderNewTask(
              title: 'Priority',
              opacity: 1,
              fontSize: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PriorityItem(
                taskPriority: selectedTaskPriority,
                taskPrioritis: TaskPriority.values,
                onTaskpriorityChanged: (taskPriority) {
                  setState(
                    () {
                      selectedTaskPriority = taskPriority;
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Expanded(
                  child: HeaderNewTask(
                    title: 'Get alert for this task',
                    opacity: 1,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Image.asset(
                    AppIcons.on,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: PrimaryButton(title: "Create Task"),
            ),
          ],
        ),
      ),
    );
  }
}
