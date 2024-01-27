import 'package:flutter/material.dart';

import '../../../../utils/colors/colors.dart';

class IconWithTitle extends StatelessWidget {
  const IconWithTitle({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 10, color: AppColors.grey),
        )
      ],
    );
  }
}
