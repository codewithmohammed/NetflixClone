import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/features/home/presentation/bloc/home_bloc.dart';
import 'package:netflixclone/features/home/presentation/widgets/verical_icon_button.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const CircularProgressIndicator(
                color: Colors.redAccent,
              );
            }
            if (state is HomeMovieFailure) {
              return Container(
                child: Text(state.error),
              );
            }
            if (state is! HomeMovieSuccess) {
              return const CircularProgressIndicator.adaptive();
            }
            final movieModel = state.firstMovieModel[index];
            return Container(
              height: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          '${Constants.imagePath}${movieModel.posterPath}'),
                      fit: BoxFit.cover)),
            );
          },
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
        ),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const CircularProgressIndicator(
                color: Colors.redAccent,
              );
            }
            if (state is HomeMovieFailure) {
              return Text('${state.error}hello');
            }
            if (state is! HomeMovieSuccess) {
              return const CircularProgressIndicator.adaptive();
            }
            final movieModel = state.firstMovieModel[index];
            return Positioned(
                bottom: 110,
                child: SizedBox(
                  width: 250,
                  child: Image.network(
                      '${Constants.imagePath}${movieModel.posterPath}'),
                ));
          },
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                  icon: Icons.add,
                  title: 'My List',
                  onTap: () {},
                ),
                FilledButton.icon(
                    style: FilledButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow),
                    label: const Text(
                      'Play',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    )),
                VerticalIconButton(
                  icon: Icons.info_outline,
                  title: 'Info',
                  onTap: () {},
                ),
              ],
            ))
      ],
    );
  }
}
