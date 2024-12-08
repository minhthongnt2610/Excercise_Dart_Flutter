import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import 'calendar_item.dart';

class SetDate extends StatefulWidget {
  const SetDate({
    super.key,
  });

  @override
  State<SetDate> createState() => _setDate();
}

class _setDate extends State<SetDate> {
  final List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sun'];
  late String? selectedDate = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new),
              color: AppColors.hexBA83DE,
            ),
            const Text(
              '5 Mar - 9 Mar',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: AppColors.hexBA83DE,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
              color: AppColors.hexBA83DE,
            ),
          ],
        ),
        SizedBox(
          // width: 58,
          height: 70,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            // itemCount: weekDays.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate = '${index = index % 31}';
                  });
                },
                child: CalendarItem(
                  day: '${index = index % 31 + 1}',
                  weekDay: weekDays[index % weekDays.length],
                  isSelected: '${index = index % 31 + 1}' == selectedDate,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
