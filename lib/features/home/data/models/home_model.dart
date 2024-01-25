
class HomeMovieModel {
  final String posterPath;
  final String title;
  final String backdropPath;
  final String originalTitle;
  final String overview;
  final String releaseDate;

  HomeMovieModel(
      {required this.posterPath,
      required this.title,
      required this.backdropPath,
      required this.originalTitle,
      required this.overview,
      required this.releaseDate});

  factory HomeMovieModel.fromJson(Map<String, dynamic> json) {
    return HomeMovieModel(
        posterPath: json["poster_path"],
        title: json["title"],
        backdropPath: json["backdrop_path"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        releaseDate: json["release_date"]);
  }
}
