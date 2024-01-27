import 'dart:convert';
import 'package:netflixclone/features/home/data/datasource/home_data_souce.dart';
import 'package:netflixclone/features/home/data/models/home_model.dart';


class HomeMovieRepository {
  final HomeMovieProvider homeMovieProvider;
  HomeMovieRepository(this.homeMovieProvider);
    Future<List<HomeMovieModel>> getmoviesfor(
      String result, String apiClientMovieURL) async {
    try {
      final previewMovieData = await homeMovieProvider.getHomeMovies(apiClientMovieURL);

      final decodedData = json.decode(previewMovieData)[result] as List;
      return decodedData
          .map((movie) => HomeMovieModel.fromJson(movie))
          .toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
