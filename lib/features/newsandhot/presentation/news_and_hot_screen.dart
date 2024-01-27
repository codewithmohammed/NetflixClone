import 'package:flutter/material.dart';
import 'package:netflixclone/features/newsandhot/presentation/widgets/tabbar_widget.dart';
import 'package:netflixclone/features/newsandhot/screens/comingsoon/coming_soon.dart';
import 'package:netflixclone/features/newsandhot/screens/everyoneswatching/everyones_watching.dart';
import 'package:netflixclone/presentation/appbar/custom_appbar.dart';

class NewsAndHotScreen extends StatelessWidget {
  const NewsAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: CustomAppBar(
              leadingText: 'News and Hot',
              bottom: TabBarWidget(),
            ),
          ),
          body: TabBarView(
            children: [
              ComingSoonScreen(),
              EveryonesWatching(),
            ],
          )),
    );
  }
}
