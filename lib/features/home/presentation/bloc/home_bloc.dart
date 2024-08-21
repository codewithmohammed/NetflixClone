import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/features/home/data/models/home_model.dart';
import 'package:netflixclone/features/home/data/repository/home_repository.dart';
import 'package:netflixclone/infrastructure/network/api_client.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeMovieRepository homeMovieRepository;
  HomeBloc(this.homeMovieRepository) : super(HomeInitial()) {
    // on<HomeSetOffset>((event, emit) {
    //   emit(HomeOffsetChanged(event.offset));
    // });
    on<HomeFetchMoviesEvent>(_getHomeMovies);
  }

  void _getHomeMovies(
      HomeFetchMoviesEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final firsthomeMovie = await homeMovieRepository.getmoviesfor(
          'results', ApiClient.searchMovies);    print('hellllo');
      final secondhomeMovie = await homeMovieRepository.getmoviesfor(
          'results', ApiClient.downloadPageUrl);    print('hellllo');
      final fourthhomeMovie = await homeMovieRepository.getmoviesfor(
          'results', ApiClient.newandhot2);    print('hellllo');
      final fifthhomeMovie = await homeMovieRepository.getmoviesfor(
          'results', ApiClient.homeMovie1);
      print('hellllo');
      emit(HomeMovieSuccess(
        firstMovieModel: firsthomeMovie,
        secondMovieModel: secondhomeMovie,
        fourthMovieModel: fourthhomeMovie,
        fifthMovieModel: fifthhomeMovie,
      ));
    } catch (e) {
      emit(HomeMovieFailure(e.toString()));
    }
  }
}

class ScrollBloc extends Bloc<ScrollEvent, ScrollState> {
  ScrollBloc() : super(ScrollInitial()) {
    on<ScrollSetOffset>((event, emit) {
      emit(ScrollOffsetChanged(event.offset));
    });
  }
}
