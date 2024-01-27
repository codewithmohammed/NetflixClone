import 'package:flutter/material.dart';
import 'package:netflixclone/utils/icons/custom_icons_icons.dart';

import '../../utils/widgets/constant_widgets.dart';

class CustomAppBar extends StatelessWidget  {
  const CustomAppBar(
      {super.key, required this.leadingText, required this.bottom});
  final String leadingText;
  final PreferredSizeWidget? bottom;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 200,
      leading: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          leadingText,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
        ),
      ),
      actions: const [
        Icon(
          CustomIcons.mirror,
          size: 30,
        ),
        kWidth,
        Icon(CustomIcons.user),
        kWidth,
      ],
      bottom: bottom,
    );
  }
}
