
import 'package:netflixclone/core/provider/movie_provider.dart';
import 'package:netflixclone/infrastructure/network/api_client.dart';

class FastLaughMovieProvider {
  Future<String> getFastLaughMovies() async {
    try {
      return MovieProvider.getMovies(ApiClient.searchMovies);
    } catch (e) {
      throw e.toString();
    }
  }
  Future<String> getFastLaughMovieTrailers(int movieID) async {
    try {
      return MovieProvider.getMovies("https://api.themoviedb.org/3/movie/$movieID/videos?api_key=1558780733f981bb66b75d6f7643a2e5");
    } catch (e) {
      throw e.toString();
    }
  }
}

// Future<List<MovieModel>> getdownloadMovies() async {
//   final response = await http.get(Uri.parse(ApiClient.nowPlayingUrl));
//   if (response.statusCode == 200) {
//     final decodedData = json.decode(response.body)['downloadimages'] as List;
//     return decodedData.map((movie) => MovieModel.fromJson(movie)).toList();
//   } else {
//     throw Exception('Something Happend');
//   }
// }
