import 'dart:convert';

import 'package:netflixclone/features/downloads/data/datasources/movie_remote_data_source.dart';
import 'package:netflixclone/features/downloads/data/models/download_movie_model.dart';

class DownloadMovieRepository {
  final DownloadMovieProvider downloadMovieProvider;
  DownloadMovieRepository(this.downloadMovieProvider);

  Future<List<DownloadMovieModel>> getDownloadMovie() async {
    try {
      final downloadMovieData = await downloadMovieProvider.getDownloadMovies();

      final decodedData = json.decode(downloadMovieData)['downloadimages'] as List;

      // if (decodedData['cod'] != '200') {
      //   throw 'An unexpected error occured';
      // }
      return decodedData.map((movie) => DownloadMovieModel.fromJson(movie)).toList();

    } catch (e) {
      throw e.toString();
    }
  }
}
