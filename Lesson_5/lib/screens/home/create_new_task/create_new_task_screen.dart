import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/header_new_task.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/input_text_filed.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/set_time.dart';

class CreateNewTaskScreen extends StatefulWidget {
  const CreateNewTaskScreen({super.key});

  @override
  State<CreateNewTaskScreen> createState() => _createNewTaskScreen();
}

class _createNewTaskScreen extends State<CreateNewTaskScreen> {
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hex020206,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const HeaderNewTask(
              title: 'Schedule',
              opacity: 1,
              fontSize: 22,
            ),
            const InputTextFiled(hint: 'Name', sizeWeigh: 60, maxLines: 1),
            const InputTextFiled(
                hint: 'Description', sizeWeigh: 120, maxLines: 3),
            const SizedBox(
              height: 20,
            ),
            Row(
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
                  width: 11,
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
          ],
        ),
      ),
    );
  }
}
