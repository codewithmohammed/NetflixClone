import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/features/downloads/data/datasources/movie_remote_data_source.dart';
import 'package:netflixclone/features/downloads/data/models/download_movie_model.dart';
import 'package:netflixclone/features/downloads/data/repositories/movie_repository.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final DownloadMovieRepository downloadMovieRepository;
  DownloadBloc(this.downloadMovieRepository) : super(DownloadInitial()) {
    on<FetchMovieRequested>(_getDownloadMovies);
  }

  void _getDownloadMovies(
      FetchMovieRequested event, Emitter<DownloadState> emit) async {
    emit(DownloadLoading());
    try {
      final downloadMovie = await downloadMovieRepository.getDownloadMovie();
      emit(DownloadSuccess(downloadMovieModel: downloadMovie));
    } catch (e) {
      emit(DownloadFailure(e.toString()));
    }
  }
}
