
import 'package:flutter/material.dart';

import '../../../utils/dimensions/dimensions.dart';

class OnboardingDesign extends StatelessWidget {
  const OnboardingDesign({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });

  final String title;
  final String subTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final kHeight = ScreenDimension.screenHeight(context);
    final kWidth = ScreenDimension.screenWidth(context);
    return Stack(
      children: [
        Container(
          foregroundDecoration: const BoxDecoration(
              backgroundBlendMode: BlendMode.darken,
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          height: kHeight,
          width: kWidth,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.directional(
          textDirection: TextDirection.ltr,
          start: kWidth * 0.05,
          bottom: kHeight * 0.20,
          width: kWidth * 0.35,
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: kWidth * 0.045, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                subTitle,
                style: TextStyle(
                    fontSize: kWidth * 0.023, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
