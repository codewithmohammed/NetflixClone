part of 'comingsoon_bloc.dart';

@immutable
sealed class ComingsoonState {}

final class ComingsoonInitial extends ComingsoonState {}

final class ComingSoonMovieIsLoading extends ComingsoonState {}

final class ComingSoonMovieIsLoaded extends ComingsoonState {
  final List<NewsAndHotMovieModel> newsandhotMovieModel;

  ComingSoonMovieIsLoaded({required this.newsandhotMovieModel});
}

final class ComingSoonMovieIsFailure extends ComingsoonState {
  final String error;

  ComingSoonMovieIsFailure(this.error);
}
