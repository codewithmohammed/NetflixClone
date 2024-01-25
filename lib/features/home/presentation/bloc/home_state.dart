part of 'home_bloc.dart';

sealed class HomeState {}
sealed class ScrollState {}

final class HomeInitial extends HomeState {}

final class ScrollInitial extends ScrollState{}

final class ScrollOffsetChanged extends ScrollState {
  final double offset;

  ScrollOffsetChanged(this.offset);
}

final class HomeMovieSuccess extends HomeState {
  final List<HomeMovieModel> firstMovieModel;
  final List<HomeMovieModel> secondMovieModel;
  // final List<HomeMovieModel> thirdMovieModel;
  final List<HomeMovieModel> fourthMovieModel;
  final List<HomeMovieModel> fifthMovieModel;
  // final List<HomeMovieModel> sixthMovieModel;

  HomeMovieSuccess(
      {required this.firstMovieModel,
      required this.secondMovieModel,
      // required this.thirdMovieModel,
      required this.fourthMovieModel,
      required this.fifthMovieModel,
      // required this.sixthMovieModel
      });
}

final class HomeMovieFailure extends HomeState {
  final String error;

  HomeMovieFailure(this.error);
}


final class HomeLoading extends HomeState{}