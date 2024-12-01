import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lesson_5/constants/app_colors.dart';
import 'package:lesson_5/constants/app_images.dart';
import 'package:lesson_5/screens/home/widgets/search_field.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    required this.onSearchChanged,
    super.key,
  });

  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: AppColors.hex020206,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: const Text(
        "You have got 5 tasks\ntoday to complete🤡",
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleSpacing: 20,
      actions: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(22)),
              child: Image.asset(
                AppImages.avatar,
                width: 45,
                height: 45,
              ),
            ),
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.purple[200],
                borderRadius: const BorderRadius.all(
                  Radius.circular(22),
                ),
              ),
              alignment: Alignment.center,
              child: const ClipRRect(
                child: Text(
                  "5",
                  style: TextStyle(fontSize: 9, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(82),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          child: SearchField(
            hintText: "Search task here",
            onChanged: onSearchChanged,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}