import 'package:flutter/material.dart';
import 'package:netflixclone/features/downloads/data/datasources/movie_remote_data_source.dart';
import 'package:netflixclone/features/downloads/data/repositories/movie_repository.dart';
import 'package:netflixclone/features/downloads/presentation/bloc/download_bloc.dart';
import 'package:netflixclone/features/main/presentation/main_screen.dart';
import 'package:netflixclone/features/home/presentation/home_screen.dart';
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
    return RepositoryProvider(
      create: (context) => DownloadMovieRepository(DownloadMovieProvider()),
      child: BlocProvider(
        create: (context) => DownloadBloc(context.read<DownloadMovieRepository>()),
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
