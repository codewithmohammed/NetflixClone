import 'package:http/http.dart' as http;

class MovieProvider {
  static Future<String> getMovies(String movieUrl) async {
    try {
      final response = await http.get(Uri.parse(movieUrl));
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 400) {
        throw 'Bad Request';
      } else if (response.statusCode == 401) {
        throw 'Unauthorized';
      } else if (response.statusCode == 403) {
        throw 'Forbidden';
      } else if (response.statusCode == 404) {
        throw 'Not Found';
      } else if (response.statusCode == 405) {
        throw 'Method Not Allowed';
      } else if (response.statusCode == 408) {
        throw 'Request Timeout';
      } else if (response.statusCode == 500) {
        throw 'Internal Server Error';
      } else if (response.statusCode == 502) {
        throw 'Bad Gateway';
      } else if (response.statusCode == 503) {
        throw 'Service Unavailable';
      } else if (response.statusCode == 504) {
        throw 'Gateway Timeout';
      } else {
        throw 'An error occurred with status code: ${response.statusCode}';
      }
    } catch (e) {
      // print('Exception caught: $e');
      throw e.toString();
    }
  }
}
