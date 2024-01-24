part of 'search_bloc.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<SearchMovieModel> searchMovieModel;

  SearchSuccess({required this.searchMovieModel});
}

final class SearchFailure extends SearchState {
  final String error;

  SearchFailure(this.error);
}

final class SearchingState extends SearchState {
  final List<SearchMovieModel> searchingMovieModel;
  SearchingState({required this.searchingMovieModel});
}
