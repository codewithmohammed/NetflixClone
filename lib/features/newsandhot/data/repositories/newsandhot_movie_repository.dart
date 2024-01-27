import 'dart:convert';

// import 'package:netflixclone/features/NewsAndHots/data/datasources/download_movie_data_source.dart';
import 'package:netflixclone/features/newsandhot/data/datasources/newsandhot_movie_data_source.dart';
import 'package:netflixclone/features/newsandhot/data/models/newsandhot_movie_model.dart';
import 'package:netflixclone/infrastructure/network/api_client.dart';

class NewsAndHotMovieRepository {
  final NewsAndHotMovieProvider newsAndHotMovieProvider;
  NewsAndHotMovieRepository(this.newsAndHotMovieProvider);

  Future<List<NewsAndHotMovieModel>> getNewsAndHotMovies(String movieURL) async {
    try {
      final newsAndHotMovieData = await newsAndHotMovieProvider.getNewsAndHotMovies(movieURL);
      final decodedData = json.decode(newsAndHotMovieData)['results'] as List;
      return decodedData.map((movie) => NewsAndHotMovieModel.fromJson(movie)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
