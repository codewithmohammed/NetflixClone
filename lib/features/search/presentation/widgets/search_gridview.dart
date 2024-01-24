import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/features/search/data/models/search_movie_model.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({
    super.key,
    required this.data,
  });

  final List<SearchMovieModel> data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 10 / 16,
              crossAxisCount: 3),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final currentData = data[index];
        return Container(
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.all(Radius.circular(50))
              ),
          child: Image.network(
            '${Constants.imagePath}${currentData.posterPath}',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}