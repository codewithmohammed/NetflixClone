import 'package:flutter/material.dart';
import 'package:netflixclone/features/downloads/data/datasources/download_movie_data_source.dart';
import 'package:netflixclone/features/downloads/data/repositories/download_movie_repository.dart';
import 'package:netflixclone/features/downloads/presentation/bloc/download_bloc.dart';
import 'package:netflixclone/features/home/data/datasource/home_data_souce.dart';
import 'package:netflixclone/features/home/data/repository/home_repository.dart';
import 'package:netflixclone/features/home/presentation/bloc/home_bloc.dart';

import 'package:netflixclone/features/main/presentation/main_screen.dart';
import 'package:netflixclone/features/newsandhot/data/datasources/newsandhot_movie_data_source.dart';
import 'package:netflixclone/features/newsandhot/data/repositories/newsandhot_movie_repository.dart';
import 'package:netflixclone/features/newsandhot/screens/comingsoon/bloc/comingsoon_bloc.dart';
import 'package:netflixclone/features/newsandhot/screens/everyoneswatching/bloc/everyoneswatching_bloc.dart';

import 'package:netflixclone/features/search/data/datasources/search_movie_data_source.dart';
import 'package:netflixclone/features/search/data/repositories/search_movie_repository.dart';
import 'package:netflixclone/features/search/presentation/bloc/search_bloc.dart';

import 'package:netflixclone/presentation/themes/app_theme.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DownloadMovieRepository(DownloadMovieProvider()),
        ),
        RepositoryProvider(
          create: (context) => SearchMovieRepository(SearchMovieProvider()),
        ),
        RepositoryProvider(
          create: (context) => HomeMovieRepository(HomeMovieProvider()),
        ),
        RepositoryProvider(
          create: (context) =>
              NewsAndHotMovieRepository(NewsAndHotMovieProvider()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                DownloadBloc(context.read<DownloadMovieRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                SearchBloc(context.read<SearchMovieRepository>()),
          ),
          BlocProvider<HomeBloc>(
              create: (context) =>
                  HomeBloc(context.read<HomeMovieRepository>())),
          BlocProvider(
            create: (context) => ScrollBloc(),
          ),
          BlocProvider<ComingsoonBloc>(
              create: (context) =>
                  ComingsoonBloc(context.read<NewsAndHotMovieRepository>())),
                    BlocProvider<EveryoneswatchingBloc>(
              create: (context) =>
                  EveryoneswatchingBloc(context.read<NewsAndHotMovieRepository>())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          darkTheme: darkMode,
          home: const MainScreen(),
        ),
      ),
    );
  }
}
