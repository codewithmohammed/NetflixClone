import 'package:flutter/material.dart';
import 'package:netflixclone/utils/icons/custom_icons_icons.dart';

import '../../utils/widgets/constant_widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          kWidth,
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
          ),
          const Icon(
            CustomIcons.mirror,
            size: 30,
          ),
          kWidth,
          const Icon(CustomIcons.user),
          kWidth,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 0);
}
