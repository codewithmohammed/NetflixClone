class NewsAndHotMovieModel {
  final int id;
  final String posterPath;
  final String title;
  final String backdropPath;
  final String originalTitle;
  final String overview;
  final String releaseDate;

  NewsAndHotMovieModel(
      {required this.id,
      required this.posterPath,
      required this.title,
      required this.backdropPath,
      required this.originalTitle,
      required this.overview,
      required this.releaseDate});

  factory NewsAndHotMovieModel.fromJson(Map<String, dynamic> json) {
    return NewsAndHotMovieModel(
        id: json['id'],
        posterPath: json["poster_path"],
        title: json["title"],
        backdropPath: json["backdrop_path"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        releaseDate: json["release_date"]);
  }
}

class VideoInfoOfTheMovieModel {
  final String type;
  final String link;

  VideoInfoOfTheMovieModel({required this.type, required this.link});

  factory VideoInfoOfTheMovieModel.fromJson(Map<String, dynamic> json) {
    return VideoInfoOfTheMovieModel(type: json['type'], link: json['key']);
  }
}
