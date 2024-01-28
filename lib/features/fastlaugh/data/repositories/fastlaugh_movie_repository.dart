import 'dart:convert';
import 'package:netflixclone/features/fastlaugh/data/datasources/fastlaugh_movie_data_source.dart';
import 'package:netflixclone/features/fastlaugh/data/models/fastlaugh_movie_model.dart';

class FastLaughMovieRepository {
  final FastLaughMovieProvider fastLaughMovieProvider;
  FastLaughMovieRepository(this.fastLaughMovieProvider);

  Future<List<FastLaughMovieModel>> getFastLaughMovies() async {
    try {
      final fastLaughMovieData =
          await fastLaughMovieProvider.getFastLaughMovies();
      final decodedData = json.decode(fastLaughMovieData)['results'] as List;
      return decodedData
          .map((movie) => FastLaughMovieModel.fromJson(movie))
          .toList();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<FastLaughMovieTrailerModel> getFastLaughMovieTrailer(
      int movieID) async {
    try {
      final fastLaughMovieData =
          await fastLaughMovieProvider.getFastLaughMovieTrailers(movieID);
      final decodedData = json.decode(fastLaughMovieData)['results'] as List;
      // print(decodedData);
      // final List<dynamic> offiicialTrailer = decodedData.firstWhere(
      //     (element) => element['name'] == 'Official Trailer',
      //     orElse: () => null);
      // print(offiicialTrailer.toString());

      final listOfTrailerModel = decodedData
          .map((movie) => FastLaughMovieTrailerModel.fromJson(movie))
          .toList();

      final trailerModel = listOfTrailerModel
          .firstWhere((element) => element.name == 'Official Trailer' || element.type == 'Trailer');

      print(trailerModel);

      return trailerModel;
    } catch (e) {
      throw e.toString();
    }
  }
}
