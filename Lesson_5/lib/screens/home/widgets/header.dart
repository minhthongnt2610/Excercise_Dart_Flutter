import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({
    required this.title,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            "See All",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.hexBA83DE,
            ),
          ),
        ],
      ),
    );
  }
}
