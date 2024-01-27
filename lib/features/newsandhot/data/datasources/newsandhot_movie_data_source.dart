
import 'package:netflixclone/core/provider/movie_provider.dart';
import 'package:netflixclone/infrastructure/network/api_client.dart';

class NewsAndHotMovieProvider {
  Future<String> getNewsAndHotMovies(String movieURL) async {
    try {
      return MovieProvider.getMovies(movieURL);
    } catch (e) {
      throw e.toString();
    }
  }
}

// Future<List<MovieModel>> getNewsAndHotMovies() async {
//   final response = await http.get(Uri.parse(ApiClient.nowPlayingUrl));
//   if (response.statusCode == 200) {
//     final decodedData = json.decode(response.body)['downloadimages'] as List;
//     return decodedData.map((movie) => MovieModel.fromJson(movie)).toList();
//   } else {
//     throw Exception('Something Happend');
//   }
// }
