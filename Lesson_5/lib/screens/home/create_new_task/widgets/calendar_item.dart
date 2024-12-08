import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({
    super.key,
    required this.day,
    required this.weekDay,
    required this.isSelected,
  });
  final String weekDay;
  final String day;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.all(10),
    //   child: Container(
    //     height: 100,
    //     width: 58,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         border: Border.all(
    //           color: isSelected ? AppColors.hexBA83DE : Colors.transparent,
    //           width: 2,
    //         )),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text(
    //           weekDay,
    //           style: TextStyle(
    //             fontSize: 15,
    //             color: isSelected
    //                 ? AppColors.hexBA83DE
    //                 : Colors.white.withOpacity(0.6),
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         Text(
    //           day,
    //           style: TextStyle(
    //             fontSize: 15,
    //             color: isSelected
    //                 ? AppColors.hexBA83DE
    //                 : Colors.white.withOpacity(0.6),
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    // return Container(
    //   width: 59,
    //
    //   height: 70,
    //
    //   /// Decoration là một lớp để tạo hình dạng, màu sắc, hoặc hiệu ứng cho container
    //   decoration: BoxDecoration(
    //     /// Bo tròn các góc của container
    //     borderRadius: BorderRadius.circular(10),
    //
    //     /// Border là một lớp để tạo viền cho container
    //     border: Border.all(
    //       /// Màu viền của container
    //       color: isSelected ? AppColors.hexBA83DE : Colors.transparent,
    //
    //       /// Độ dày của viền
    //       width: 2,
    //     ),
    //   ),
    //
    //   /// Column là một widget dùng để xếp các widget con của nó theo chiều dọc
    //   child: Column(
    //     /// Căn chỉnh các widget con của Column
    //     mainAxisAlignment: MainAxisAlignment.center,
    //
    //     /// Danh sách các widget con của Column
    //     children: [
    //       /// Hiển thị thứ trong tuần
    //       Text(
    //         /// Hiển thị thứ trong tuần
    //         weekDay,
    //
    //         /// TextStyle là một lớp để tạo kiểu cho text
    //         style: TextStyle(
    //           /// Kích thước của text
    //           fontSize: 15,
    //
    //           /// Màu của text
    //           color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
    //
    //           /// Độ đậm của text
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //
    //       /// Khoảng cách giữa các widget con
    //       const SizedBox(
    //         /// Khoảng cách theo chiều dọc
    //         height: 6,
    //       ),
    //
    //       /// Hiển thị ngày
    //       Text(
    //         /// Hiển thị ngày
    //         day,
    //
    //         /// TextStyle là một lớp để tạo kiểu cho text
    //         style: TextStyle(
    //           /// Kích thước của text
    //           fontSize: 15,
    //
    //           /// Màu của text
    //           color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
    //
    //           /// Độ đậm của text
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    return Padding(
      padding: EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 58,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? AppColors.hexBA83DE : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  weekDay,
                  style: TextStyle(
                    fontSize: 15,
                    color: isSelected
                        ? AppColors.hexBA83DE
                        : Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  day,
                  style: TextStyle(
                    fontSize: 15,
                    color: isSelected
                        ? AppColors.hexBA83DE
                        : Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -3,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                color: isSelected ? AppColors.hexBA83DE : Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
