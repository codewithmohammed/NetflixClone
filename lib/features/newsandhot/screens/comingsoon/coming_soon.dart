import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/features/newsandhot/screens/comingsoon/bloc/comingsoon_bloc.dart';
import 'package:netflixclone/features/newsandhot/screens/comingsoon/widgets/month_and_date.dart';
import 'package:netflixclone/features/newsandhot/screens/comingsoon/widgets/title_row.dart';
import 'widgets/coming_on.dart';
import 'widgets/netflix_film.dart';
import '../widgets/title_and_overview.dart';
import '../widgets/video_show_widget.dart';
import 'package:intl/intl.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ComingsoonBloc>().add(GetComingSoonMovies());
    return Scaffold(
      body: BlocBuilder<ComingsoonBloc, ComingsoonState>(
        builder: (context, state) {
          if (state is ComingSoonMovieIsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          if (state is ComingSoonMovieIsFailure) {
            return Center(
              child: Text(state.error),
            );
          }

          if (state is! ComingSoonMovieIsLoaded) {
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
                  final date = currentData.releaseDate;
                  List<String> dateParts = date.split('-');
                  final DateTime dateSplit = DateTime.parse(date);
                  final month = DateFormat('MMM').format(dateSplit);
                  final day = DateFormat('EEEE').format(dateSplit);
                  return Container(
                    padding: const EdgeInsets.all(5),
                    // color: Colors.red,
                    // height: 600,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //for the left date
                        Expanded(
                          child: MonthAndDate(
                            month: month,
                            day: dateParts[2],
                          ),
                        ),
                        //for the right column with picture
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: [
                              //this is for the picture
                              VideoShowWidget(
                                videoLink:
                                    '${Constants.imagePath}${currentData.backdropPath}',
                              ),
                              //this row for the tilte and icons
                              TitleRow(
                                title: currentData.originalTitle,
                              ),
                              //this for coming on friday
                              ComingOn(
                                onDay: day,
                              ),
                              //this for the n films and tall girls 2
                              const NetflixFilm(text: 'F I L M',),
                              // this for the paragraph
                              TitleAndOverview(
                                title: currentData.title,
                                overview: currentData.overview,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
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