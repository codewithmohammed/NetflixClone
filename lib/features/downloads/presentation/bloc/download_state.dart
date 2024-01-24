part of 'download_bloc.dart';

sealed class DownloadState {}

final class DownloadInitial extends DownloadState {}

final class DownloadLoading extends DownloadState {}

final class DownloadSuccess extends DownloadState {
  final List<DownloadMovieModel> downloadMovieModel;

  DownloadSuccess({required this.downloadMovieModel});
}

final class DownloadFailure extends DownloadState {
  final String error;

  DownloadFailure(this.error);
}
