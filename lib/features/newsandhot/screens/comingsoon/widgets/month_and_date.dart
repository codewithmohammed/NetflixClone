import 'package:flutter/material.dart';
import 'package:netflixclone/utils/colors/colors.dart';

class MonthAndDate extends StatelessWidget {
  const MonthAndDate({
    super.key,
    required this.month,
    required this.day,
  });

  final String month;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          month,
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.w900, color: AppColors.grey),
        ),
        Text(
          day,
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: AppColors.white),
        ),
      ],
    );
  }
}
