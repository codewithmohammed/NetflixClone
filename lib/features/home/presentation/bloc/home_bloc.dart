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
          'results', ApiClient.searchMovies);
      final secondhomeMovie = await homeMovieRepository.getmoviesfor(
          'results', ApiClient.downloadPageUrl);
      // final thirdhomeMovie = await homeMovieRepository.getmoviesfor(
      //     'newandhot', ApiClient.newandhot);
      final fourthhomeMovie = await homeMovieRepository.getmoviesfor(
          'results', ApiClient.newandhot2);
      final fifthhomeMovie = await homeMovieRepository.getmoviesfor(
          'results', ApiClient.homeMovie1);
      // final sixthhomeMovie = await homeMovieRepository.getmoviesfor(
      //     'toprated', ApiClient.topRatedTvSeriesUrl);

      emit(HomeMovieSuccess(
          firstMovieModel: firsthomeMovie,
          secondMovieModel: secondhomeMovie,
          // thirdMovieModel: thirdhomeMovie,
          fourthMovieModel: fourthhomeMovie,
          fifthMovieModel: fifthhomeMovie,
          // sixthMovieModel: sixthhomeMovie
          ));
    } catch (e) {
      emit(HomeMovieFailure(e.toString()));
    }
  }
}


class ScrollBloc extends Bloc<ScrollEvent,ScrollState>{
  ScrollBloc() : super(ScrollInitial()) {
    on<ScrollSetOffset>((event, emit) {
      emit(ScrollOffsetChanged(event.offset));
    });
  }}
