import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/features/home/data/models/home_model.dart';
import 'package:netflixclone/features/home/presentation/widgets/text_view.dart';

class Previews extends StatelessWidget {
  const Previews({
    super.key,
    required this.movieModel,
  });

  final List<HomeMovieModel> movieModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: TextView(title: 'Previews'),
        ),
        SizedBox(
          height: 165,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            itemBuilder: (context, index) {
              final currentData = movieModel[index];
              return GestureDetector(
                onTap: () {},
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.red, width: 4),
                          image:  DecorationImage(
                              image: NetworkImage(
                                  '${Constants.imagePath}${currentData.backdropPath}'),fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.amberAccent),
                          gradient: const LinearGradient(
                              colors: [
                                Colors.black87,
                                Colors.black45,
                                Colors.transparent
                              ],
                              stops: [
                                0,
                                0.25,
                                1
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
