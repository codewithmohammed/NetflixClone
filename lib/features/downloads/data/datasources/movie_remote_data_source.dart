
import 'package:http/http.dart' as http;
import 'package:netflixclone/infrastructure/network/api_client.dart';

class DownloadMovieProvider {
  Future<String> getDownloadMovies() async {
    try {
      final response = await http.get(Uri.parse(ApiClient.nowPlayingUrl));

      if (response.statusCode == 200) {
        return response.body;
     
      } else {
        throw 'An error occured';
      }
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
