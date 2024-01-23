import 'package:flutter/material.dart';
// import 'package:netflixclone/presentation/onboarding/appbar_indicator.dart';
import 'package:netflixclone/utils/image_path.dart';
import 'widgets/onboarding_style.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
  PageController pageController = PageController();
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: const [
            OnboardingDesign(
              title: 'Unlimited films, TV programmes & more',
              subTitle: 'Watch anywhere. Cancel at any time.',
              imagePath: ImagePaths.onboardingImage1,
            ),
            OnboardingDesign(
              title: "There's a plan for every fan",
              subTitle: 'Plans start at AED 29.',
              imagePath: ImagePaths.onboardingImage2,
            ),
            OnboardingDesign(
              title: 'Cancel online anytime',
              subTitle: 'Join today,no reason to wait',
              imagePath: ImagePaths.onboardingImage3,
            ),
            OnboardingDesign(
              title: 'Watch everywhere',
              subTitle: 'Stream on your phone, tablet, laptop and TV.',
              imagePath: ImagePaths.onboardingImage4,
            ),
          ],
        ),
        // const AppBarAndIndicator()
      ]),
    );
  }
}

