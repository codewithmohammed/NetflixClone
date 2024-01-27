import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/features/home/presentation/widgets/appbar_button.dart';
import 'package:netflixclone/utils/image/image_path.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({super.key, this.scrollOffset = 0});

  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color:
          Colors.black.withOpacity((scrollOffset / 400).clamp(0, 1).toDouble()),
      child: const CustomAppBarM(),
    );
  }
}

class CustomAppBarM extends StatelessWidget {
  const CustomAppBarM({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(ImagePaths.netflix),
        const SizedBox(width: 12.0),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppBarButton(
                title: 'TV Shows',
                onTap: () => print('TV Shows'),
              ),
              AppBarButton(
                title: 'Movies',
                onTap: () => print('Movies'),
              ),
              AppBarButton(
                title: 'Categories',
                onTap: () => print('Categories'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
