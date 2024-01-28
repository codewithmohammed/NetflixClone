class FastLaughMovieModel {
  final int id;
  final String posterPath;

  FastLaughMovieModel({
    required this.id,
    required this.posterPath,
  });

  factory FastLaughMovieModel.fromJson(Map<String, dynamic> json) {
    return FastLaughMovieModel(
      id: json['id'],
      posterPath: json["poster_path"],
    );
  }
}

class FastLaughMovieTrailerModel {
  final String key;
  final String type;
  final String name;

  FastLaughMovieTrailerModel({

    required this.key,
    required this.type,
    required this.name,
  });

  factory FastLaughMovieTrailerModel.fromJson(Map<String, dynamic> json) {
    return FastLaughMovieTrailerModel(
      key: json['key'],
      type: json['type'],
      name: json["name"],
    );
  }
}
