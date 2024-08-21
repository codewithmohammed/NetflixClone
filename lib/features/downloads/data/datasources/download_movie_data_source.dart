
import 'package:netflixclone/core/provider/movie_provider.dart';
import 'package:netflixclone/infrastructure/network/api_client.dart';

class DownloadMovieProvider {
  Future<String> getDownloadMovies() async {
    try {
      return MovieProvider.getMovies(ApiClient.downloadPageUrl);
    } catch (e) {
      throw e.toString();
    }
  }
}