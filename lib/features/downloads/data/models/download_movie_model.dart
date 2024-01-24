class DownloadMovieModel {
  final String posterPath;


  DownloadMovieModel(
      {required this.posterPath,
});

  factory DownloadMovieModel.fromJson(Map<String, dynamic> json) {
    return DownloadMovieModel(
        posterPath: json["poster_path"],);
  }
}