import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';
import 'package:lesson_5/screens/screen_all_task/widgets/all.dart';
import 'package:lesson_5/screens/screen_all_task/widgets/today.dart';
import 'package:lesson_5/screens/screen_all_task/widgets/tomorrow.dart';

import '../../common_widgets/primary_app_bar.dart';
import '../home_screen.dart';

class ScreenAllTask extends StatefulWidget {
  const ScreenAllTask({super.key});

  @override
  State<ScreenAllTask> createState() => _ScreenAllTaskState();
}

class _ScreenAllTaskState extends State<ScreenAllTask> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.hex020206,
        appBar: AppBar(
          backgroundColor: AppColors.hex020206,
          automaticallyImplyLeading: false,
          title: PrimaryAppBar(
            title: "All Tasks",
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
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColors.hexDE83B0,
            labelColor: AppColors.hexDE83B0,
            labelStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            dividerHeight: 3,
            dividerColor: Colors.white30,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Today",
              ),
              Tab(
                text: "Tomorrow",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            All(),
            Today(),
            Tomorrow(),
          ],
        ),
      ),
    );
  }
}
