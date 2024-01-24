import 'dart:convert';

import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/core/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  // final String baseUrl;
  // final String apiKey;

  // ApiClient({required this.baseUrl, required this.apiKey});

  static const trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const popularUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const downloadPageUrl =
      'https://run.mocky.io/v3/5f390db8-42fa-46de-af0c-7ca94626dd67';
  static const upComingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const topRatedTvSeriesUrl =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.apiKey}';
      //popular
  static const searchMovies =
      'https://run.mocky.io/v3/5ed5a2d0-9945-4a54-aaa3-8f68133e0db3';

}
