import 'dart:convert';
import 'package:netflixclone/features/search/data/datasources/search_movie_data_source.dart';
import 'package:netflixclone/features/search/data/models/search_movie_model.dart';

class SearchMovieRepository {
  final SearchMovieProvider searchMovieProvider;
  SearchMovieRepository(this.searchMovieProvider);

  Future<List<SearchMovieModel>> getSearchMovie() async {
    try {
      final searchMovieData = await searchMovieProvider.getSearchMovies();
      //  print(searchMovieData);
      final decodedData = json.decode(searchMovieData)['searchmovies'] as List;
     
      return decodedData
          .map((movie) => SearchMovieModel.fromJson(movie))
          .toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
