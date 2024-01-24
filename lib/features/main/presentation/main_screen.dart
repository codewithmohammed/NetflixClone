import 'package:flutter/material.dart';
import 'package:netflixclone/features/downloads/presentation/downloads_screen.dart';
import 'package:netflixclone/features/fastlaugh/presentation/fast_laugh_screen.dart';
import 'package:netflixclone/features/home/presentation/home_screen.dart';
import 'package:netflixclone/features/main/presentation/widgets/bottom_nav.dart';
import 'package:netflixclone/features/main/presentation/widgets/pages.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: pageIndexNotifier,
          builder: (context, int index, child) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
