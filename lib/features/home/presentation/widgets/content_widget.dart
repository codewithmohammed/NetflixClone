import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/features/home/data/models/home_model.dart';
import 'package:netflixclone/features/home/presentation/widgets/text_view.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
    required this.mainHead,
    required this.movieMode,
  });
  final List<HomeMovieModel> movieMode;
  final String mainHead;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextView(title: mainHead),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: movieMode.length,
              itemBuilder: (context, index) {
                final currentData = movieMode[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 200,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(
                            '${Constants.imagePath}${currentData.posterPath}',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
