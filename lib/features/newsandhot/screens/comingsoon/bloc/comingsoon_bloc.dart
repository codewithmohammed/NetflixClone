import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflixclone/features/newsandhot/data/models/newsandhot_movie_model.dart';
import 'package:netflixclone/features/newsandhot/data/repositories/newsandhot_movie_repository.dart';
import 'package:netflixclone/infrastructure/network/api_client.dart';

part 'comingsoon_event.dart';
part 'comingsoon_state.dart';

class ComingsoonBloc extends Bloc<ComingsoonEvent, ComingsoonState> {
  final NewsAndHotMovieRepository newsAndHotMovieRepository;
  ComingsoonBloc(this.newsAndHotMovieRepository) : super(ComingsoonInitial()) {
    on<GetComingSoonMovies>(_getnewsandhotMovies);
  }

  void _getnewsandhotMovies(
      GetComingSoonMovies event, Emitter<ComingsoonState> emit) async {
    emit(ComingSoonMovieIsLoading());
    try {
      final newsandhotMovie = await newsAndHotMovieRepository.getNewsAndHotMovies(ApiClient.searchMovies);
      emit(ComingSoonMovieIsLoaded(newsandhotMovieModel: newsandhotMovie));
    } catch (e) {
      emit(ComingSoonMovieIsFailure(e.toString()));
    }
  }
}
