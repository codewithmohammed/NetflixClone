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
      final listOfTrailerModel = decodedData
          .map((movie) => FastLaughMovieTrailerModel.fromJson(movie))
          .toList();
//       print(listOfTrailerModel);
//  if (listOfTrailerModel.isEmpty) {
//         print(true);
//       }
      final trailerModel = listOfTrailerModel.isNotEmpty ? listOfTrailerModel.firstWhere((element) =>
          element.name == 'Official Trailer' || element.type == 'Trailer') : FastLaughMovieTrailerModel(key: 'M7QBdqrBKOE', type: 'Trailer', name: 'name');

      // print(trailerModel);

      return trailerModel;
    } catch (e) {
      throw e.toString();
    }
  }
}
