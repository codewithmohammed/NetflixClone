import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/features/fastlaugh/data/models/fastlaugh_movie_model.dart';
import 'package:netflixclone/features/fastlaugh/data/repositories/fastlaugh_movie_repository.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';

class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  final FastLaughMovieRepository fastLaughMovieRepository;
  FastLaughBloc(this.fastLaughMovieRepository) : super(FastLaughInitial()) {
    on<FetchMovieRequested>(_getFastLaughMovies);
  }

  void _getFastLaughMovies(
      FetchMovieRequested event, Emitter<FastLaughState> emit) async {
    emit(FastLaughLoading());
    try {
      final fastLaughMovie =
          await fastLaughMovieRepository.getFastLaughMovies();

      // print(fastLaughMovie[4].id);
      final List<FastLaughMovieTrailerModel> trailerModelList =
          await _getAllTheTrailers(fastLaughMovie);

      // print(fastLaughMovie.length);
      // print(trailerModelList.length);
      //  await Future.delayed(Duration(seconds: 5));

      // print(trailerModelList.length);

      // List<FastLaughMovieTrailerModel> trailerModelList = [];
      // for (int i = 0; i < listOfID.length; i++) {
      //   final trailerInstance = await fastLaughMovieRepository
      //       .getFastLaughMovieTrailer(listOfID[i]);
      //   trailerModelList.add(trailerInstance);
      // }
      // print(trailerModelList.length);
      // print(one.first.key);
      //   // List<String> movietrailers = [];
      // for (int i = 0; i < listOfID.length; i++) {

      // }
      emit(FastLaughSuccess(
          fastLaughMovieModel: fastLaughMovie,
          fastLaughMovieTrailerModel: trailerModelList));
    } catch (e) {
      emit(FastLaughFailure(e.toString()));
    }
  }

  _getAllTheTrailers(List<FastLaughMovieModel> fastLaughMovie) async {
    List<FastLaughMovieTrailerModel> trailerModelList = [];
    for (var model in fastLaughMovie) {
      final trailerInstance =
          await fastLaughMovieRepository.getFastLaughMovieTrailer(model.id);
      trailerModelList.add(trailerInstance);
      print(trailerInstance.name);
    }
    return trailerModelList;
  }
}
