import 'package:flutter/material.dart';
import 'package:netflixclone/utils/colors/colors.dart';

class IconWithTitleShadow extends StatelessWidget {
  const IconWithTitleShadow({
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
          shadows: const [
            Shadow(color: Colors.black, blurRadius: 50, offset: Offset(5, 0))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 10, color: AppColors.white),
        )
      ],
    );
  }
}