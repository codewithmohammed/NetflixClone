import 'package:http/http.dart' as http;

class MovieProvider {
  static Future<String> getMovies(String movieUrl) async {
    try {
      final response = await http.get(Uri.parse(movieUrl));
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
