
import 'package:netflixclone/core/provider/movie_provider.dart';
import 'package:netflixclone/infrastructure/network/api_client.dart';

class SearchMovieProvider {
  Future<String> getSearchMovies() async {
    try {
      return MovieProvider.getMovies(ApiClient.searchMovies);
    } catch (e) {
      throw e.toString();
    }
  }
}
