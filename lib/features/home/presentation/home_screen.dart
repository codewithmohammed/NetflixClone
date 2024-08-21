import 'package:flutter/material.dart';
import 'package:netflixclone/features/home/presentation/bloc/home_bloc.dart';
import 'package:netflixclone/features/home/presentation/widgets/content_header.dart';
import 'package:netflixclone/features/home/presentation/widgets/content_widget.dart';
import 'package:netflixclone/features/home/presentation/widgets/home_customappbar.dart';

import 'package:netflixclone/utils/colors/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/previews.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        context
            .read<ScrollBloc>()
            .add(ScrollSetOffset(scrollController.offset));
      });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeFetchMoviesEvent());
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.greylight1,
        child: const Icon(Icons.cast),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: BlocBuilder<ScrollBloc, ScrollState>(
          builder: (context, state) {
            if (state is ScrollOffsetChanged) {
              return HomeCustomAppBar(
                scrollOffset: state.offset,
              );
            } else {
              return Container(); // Placeholder for now
            }
          },
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
        if (state is HomeMovieFailure) {
          return Text(state.error);
        }
        if (state is! HomeMovieSuccess) {
          return const Text('state.error');
        }
        return CustomScrollView(controller: scrollController, slivers: [
          const SliverToBoxAdapter(
              child: ContentHeader(
                  // index: 1,
                  )),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                movieModel: state.firstMovieModel,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: ContentWidget(
            mainHead: 'Released in the Past Year',
            movieMode: state.secondMovieModel,
          )),
          SliverToBoxAdapter(
            child: ContentWidget(
              mainHead: 'Trending Now',
              movieMode: state.firstMovieModel,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentWidget(
              mainHead: 'Tense Dramas',
              movieMode: state.fourthMovieModel,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentWidget(
              mainHead: 'South Indian Cinemas',
              movieMode: state.fifthMovieModel,
            ),
          ),
        ]);
      }),
    );
  }
}
