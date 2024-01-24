part of 'search_bloc.dart';

sealed class SearchEvent {}

final class FetchMovieRequested extends SearchEvent {
  final String searchText;
  FetchMovieRequested({required this.searchText});
}

final class Searching extends SearchEvent {
  final String searchText;
  Searching({required this.searchText});
}
