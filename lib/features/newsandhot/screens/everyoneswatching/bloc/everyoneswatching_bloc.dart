import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/features/newsandhot/data/models/newsandhot_movie_model.dart';
import 'package:netflixclone/features/newsandhot/data/repositories/newsandhot_movie_repository.dart';
import 'package:netflixclone/infrastructure/network/api_client.dart';

part 'everyoneswatching_event.dart';
part 'everyoneswatching_state.dart';

class EveryoneswatchingBloc
    extends Bloc<EveryoneswatchingEvent, EveryoneswatchingState> {
  final NewsAndHotMovieRepository newsAndHotMovieRepository;
  EveryoneswatchingBloc(this.newsAndHotMovieRepository)
      : super(EveryoneswatchingInitial()) {
    on<GetEveryoneswathchingMovies>(_getnewsandhotMovies);
  }

  void _getnewsandhotMovies(GetEveryoneswathchingMovies event,
      Emitter<EveryoneswatchingState> emit) async {
    emit(EveryoneswatchingMovieIsLoading());
    try {
      final newsandhotMovie = await newsAndHotMovieRepository
          .getNewsAndHotMovies(ApiClient.searchMovies);
      // print(newsandhotMovie[1].id);
      // List<String> linkOfAllModels = [];
      // for (var model in newsandhotMovie) {
      //   linkOfAllModels.add();
      // }
      // print(linkOfAllModels);
      emit(EveryoneswatchingMovieIsLoaded(
          newsandhotMovieModel: newsandhotMovie));
    } catch (e) {
      emit(EveryoneswatchingMovieIsFailure(e.toString()));
    }
  }
}
