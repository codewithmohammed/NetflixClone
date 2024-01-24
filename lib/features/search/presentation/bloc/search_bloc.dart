import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/features/search/data/models/search_movie_model.dart';
import 'package:netflixclone/features/search/data/repositories/search_movie_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovieRepository searchMovieRepository;
  SearchBloc(this.searchMovieRepository) : super(SearchInitial()) {
    on<FetchMovieRequested>(_getSearchMovies);
    // on<Searching>(_changeUI);
  }

  void _getSearchMovies(
      FetchMovieRequested event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final searchMovie = await searchMovieRepository.getSearchMovie();
      if (event.searchText.trim().isNotEmpty) {
        emit(SearchingState(searchingMovieModel: searchMovie));
      } else {
        emit(SearchSuccess(searchMovieModel: searchMovie));
      }
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }

  // void _changeUI(Searching event, Emitter<SearchState> emit) async {
  //   emit(SearchLoading());
  //   if (event.searchText.trim() != '') {
  //     try {
  //       final searchMovie = await searchMovieRepository.getSearchMovie();
  //       emit(SearchingState(searchingMovieModel: searchMovie));

  //       // final searchMovie = await searchMovieRepository.getSearchMovie();
  //       // emit(SearchSuccess(searchMovieModel: searchMovie));
  //     } catch (e) {
  //       emit(SearchFailure(e.toString()));
  //     }
  //   }
  // }
}
