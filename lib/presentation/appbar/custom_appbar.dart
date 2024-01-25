import 'package:flutter/material.dart';
import 'package:netflixclone/utils/icons/custom_icons_icons.dart';

import '../../utils/widgets/constant_widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.leading});

  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Expanded(
          child: leading
        ),
        const Icon(
          CustomIcons.mirror,
          size: 30,
        ),
        kWidth,
        const Icon(CustomIcons.user),
        kWidth,
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 0);
}
