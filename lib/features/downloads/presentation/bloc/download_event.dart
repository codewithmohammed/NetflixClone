part of 'download_bloc.dart';


sealed class DownloadEvent {}


final class FetchMovieRequested extends DownloadEvent{}