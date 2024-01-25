
import 'package:netflixclone/core/provider/movie_provider.dart';


class SearchMovieProvider {
  Future<String> getSearchMovies(String apiClient) async {
    try {
      return MovieProvider.getMovies(apiClient);
    } catch (e) {
      throw e.toString();
    }
  }
}
