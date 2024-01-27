import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/features/newsandhot/screens/everyoneswatching/bloc/everyoneswatching_bloc.dart';
import 'package:netflixclone/features/newsandhot/screens/widgets/icon_with_title.dart';
import 'package:netflixclone/features/newsandhot/screens/comingsoon/widgets/netflix_film.dart';
import 'package:netflixclone/features/newsandhot/screens/widgets/title_and_overview.dart';
import 'package:netflixclone/features/newsandhot/screens/widgets/video_show_widget.dart';
import 'package:netflixclone/utils/icons/custom_icons_icons.dart';
import 'package:netflixclone/utils/widgets/constant_widgets.dart';

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({super.key});

  @override
  Widget build(BuildContext context) {
     context.read<EveryoneswatchingBloc>().add(GetEveryoneswathchingMovies());
    return Scaffold(
      body: BlocBuilder<EveryoneswatchingBloc, EveryoneswatchingState>(
        builder: (context, state) {
             if (state is EveryoneswatchingMovieIsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          if (state is EveryoneswatchingMovieIsFailure) {
            return Center(
              child: Text(state.error),
            );
          }

          if (state is! EveryoneswatchingMovieIsLoaded) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverAnimatedList(
                initialItemCount: state.newsandhotMovieModel.length,
                itemBuilder: (context, index, animation) {
                  final currentData = state.newsandhotMovieModel[index];
                  // final date = currentData.releaseDate;
                  // List<String> dateParts = date.split('-');
                  // final DateTime dateSplit = DateTime.parse(date);
                  // final month = DateFormat('MMM').format(dateSplit);
                  // final day = DateFormat('EEEE').format(dateSplit);
                  return Container(
                    padding: const EdgeInsets.all(5),
                    // color: Colors.red,
                    // height: 600,
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           TitleAndOverview(
                            title: currentData.title,
                            overview: currentData.overview,
                          ),
                           VideoShowWidget(
                            videoLink:
                                '${Constants.imagePath}${currentData.backdropPath}',
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: Row(
                              children: [
                                Container(
                                  decoration:  BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                             '${Constants.imagePath}${currentData.posterPath}',))),
                                ),
                                const Spacer(),
                                const Row(
                                  children: [
                                    IconWithTitle(
                                        title: 'Share',
                                        icon: CustomIcons.share),
                                    kWidth,
                                    IconWithTitle(
                                        title: 'My List',
                                        icon: CustomIcons.plus),
                                    kWidth,
                                    IconWithTitle(
                                        title: 'Play', icon: CustomIcons.play),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // for the left date
                          const NetflixFilm(text: 'S E R I E S'),
                        ]),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
