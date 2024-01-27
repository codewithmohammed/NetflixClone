part of 'everyoneswatching_bloc.dart';

sealed class EveryoneswatchingState {}

final class EveryoneswatchingInitial extends EveryoneswatchingState {}


final class EveryoneswatchingMovieIsLoading extends EveryoneswatchingState {}

final class EveryoneswatchingMovieIsLoaded extends EveryoneswatchingState {
  final List<NewsAndHotMovieModel> newsandhotMovieModel;

  EveryoneswatchingMovieIsLoaded({required this.newsandhotMovieModel});
}

final class EveryoneswatchingMovieIsFailure extends EveryoneswatchingState {
  final String error;

  EveryoneswatchingMovieIsFailure(this.error);
}
