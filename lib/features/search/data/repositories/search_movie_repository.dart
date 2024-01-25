import 'dart:convert';
import 'package:netflixclone/features/search/data/datasources/search_movie_data_source.dart';
import 'package:netflixclone/features/search/data/models/search_movie_model.dart';

class SearchMovieRepository {
  final SearchMovieProvider searchMovieProvider;
  SearchMovieRepository(this.searchMovieProvider);

  Future<List<SearchMovieModel>> getSearchMovie(
      {required String apiClient, required String result}) async {
    try {
      final searchMovieData =
          await searchMovieProvider.getSearchMovies(apiClient);
      //  print(searchMovieData);
      final decodedData = json.decode(searchMovieData)[result] as List;
      // print(decodedData);
     
          
      // print('$hello'+'ki');
      return decodedData.map((movie) => SearchMovieModel.fromJson(movie)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
