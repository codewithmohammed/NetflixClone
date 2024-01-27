import 'package:flutter/material.dart';
import 'package:netflixclone/utils/colors/colors.dart';

class TitleAndOverview extends StatelessWidget {
  const TitleAndOverview({
    super.key,
    required this.title,
    required this.overview,
  });

  final String title;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                const TextStyle(fontSize: 20,fontWeight: FontWeight.w900, overflow: TextOverflow.ellipsis),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              overview,
              style: const TextStyle(color: AppColors.greylight1),
            ),
          )
        ],
      ),
    );
  }
}
