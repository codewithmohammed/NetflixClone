part of 'fast_laugh_bloc.dart';

sealed class FastLaughState {}

final class FastLaughInitial extends FastLaughState {}

final class FastLaughLoading extends FastLaughState {}

final class FastLaughSuccess extends FastLaughState {
  final List<FastLaughMovieModel> fastLaughMovieModel;
  final List<FastLaughMovieTrailerModel> fastLaughMovieTrailerModel;

  FastLaughSuccess({required this.fastLaughMovieTrailerModel, required this.fastLaughMovieModel});
}

final class FastLaughFailure extends FastLaughState {
  final String error;

  FastLaughFailure(this.error);
}
