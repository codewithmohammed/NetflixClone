
import 'package:netflixclone/core/provider/movie_provider.dart';
import 'package:netflixclone/infrastructure/network/api_client.dart';

class SearchMovieProvider {
  Future<String> getSearchMovies(String apiClient) async {
    try {
      return MovieProvider.getMovies(apiClient);
    } catch (e) {
      throw e.toString();
    }
  }
}
