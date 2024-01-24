import 'package:flutter/material.dart';
import 'package:netflixclone/utils/colors/colors.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w900));
  }
}
