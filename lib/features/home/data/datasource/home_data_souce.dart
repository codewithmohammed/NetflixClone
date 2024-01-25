import 'package:netflixclone/core/provider/movie_provider.dart';

class HomeMovieProvider {
  Future<String> getHomeMovies(String apiClientMovieURL) {
    try {
      return MovieProvider.getMovies(apiClientMovieURL);
    } catch (e) {
      throw e.toString();
    }
  }
}
