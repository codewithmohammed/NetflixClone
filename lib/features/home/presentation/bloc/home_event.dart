part of 'home_bloc.dart';

sealed class ScrollEvent {}
final class ScrollSetOffset extends ScrollEvent{
    final double offset;

  ScrollSetOffset(this.offset);
}



sealed class HomeEvent {}
final class HomeFetchMoviesEvent extends HomeEvent{}