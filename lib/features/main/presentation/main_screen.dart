import 'package:flutter/material.dart';
import 'package:netflixclone/features/downloads/presentation/downloads.dart';
import 'package:netflixclone/features/fastlaugh/presentation/fast_laugh.dart';
import 'package:netflixclone/features/home/presentation/home_screen.dart';
import 'package:netflixclone/features/main/presentation/widgets/bottom_nav.dart';
import 'package:netflixclone/features/newsandhot/presentation/widgets/news_and_hot.dart';
import 'package:netflixclone/features/search/presentation/search.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final _pages = [
    const HomeScreen(),
    const NewsAndHotScreen(),
    const FastLaughScreen(),
    const SearchScreen(),
    const DownloadScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: pageIndexNotifier,
          builder: (context, int index, child) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
