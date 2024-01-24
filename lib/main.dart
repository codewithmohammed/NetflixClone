import 'package:flutter/material.dart';
import 'package:netflixclone/features/downloads/data/datasources/download_movie_data_source.dart';
import 'package:netflixclone/features/downloads/data/repositories/download_movie_repository.dart';
import 'package:netflixclone/features/downloads/presentation/bloc/download_bloc.dart';
import 'package:netflixclone/features/main/presentation/main_screen.dart';
import 'package:netflixclone/features/home/presentation/home_screen.dart';
import 'package:netflixclone/features/search/data/datasources/search_movie_data_source.dart';
import 'package:netflixclone/features/search/data/repositories/search_movie_repository.dart';
import 'package:netflixclone/features/search/presentation/bloc/search_bloc.dart';
import 'package:netflixclone/presentation/onboarding/onboarding_screen.dart';
import 'package:netflixclone/presentation/onboarding/widgets/appbar_indicator.dart';
import 'package:netflixclone/presentation/splash/splash_screen.dart';
import 'package:netflixclone/presentation/themes/app_theme.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          darkTheme: darkMode,
          home: MainScreen(),
        ),
      ),
    );
  }
}
