import 'package:flutter/material.dart';
import 'package:netflixclone/features/home/presentation/home_screen.dart';
import 'package:netflixclone/presentation/onboarding/onboarding_screen.dart';
import 'package:netflixclone/presentation/onboarding/widgets/appbar_indicator.dart';
import 'package:netflixclone/presentation/splash/splash_screen.dart';
import 'package:netflixclone/presentation/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const OnBoardingScreen(),
    );
  }
}
