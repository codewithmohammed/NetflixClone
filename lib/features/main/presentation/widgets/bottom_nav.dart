import 'package:flutter/material.dart';
import 'package:netflixclone/utils/colors/colors.dart';

import '../../../../utils/icons/custom_icons_icons.dart';

ValueNotifier<int> pageIndexNotifier = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageIndexNotifier,
      builder: (context, int index, _) {
        return BottomNavigationBar(
          currentIndex: index,
          onTap: (index) {
            pageIndexNotifier.value = index;
          },
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: AppColors.grey,
          selectedItemColor: AppColors.neutralgreylight,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.homeIcon), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.vector), label: 'News & Hot'),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.laugh_beam), label: 'Fast Laughs'),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.searchIcon),
              label: 'Search',
            ),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.download), label: 'Downloads'),
          ],
        );
      },
    );
  }
}
