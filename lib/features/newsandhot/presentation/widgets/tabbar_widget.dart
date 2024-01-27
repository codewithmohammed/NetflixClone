import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBar(
        padding: EdgeInsets.only(left: 5, right: 5),
        splashBorderRadius: BorderRadius.all(Radius.circular(60)),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.white,
        dividerColor: Colors.black,
        indicatorPadding: EdgeInsets.only(top: 10, bottom: 10),
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(60),
          ),
        ),
        tabs: [
          Tab(
            text: '\u{1F37F} Coming Soon',
          ),
          Tab(
            text: "\u{1F525} Everyone's Watching",
          ),
        ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 100);
}
