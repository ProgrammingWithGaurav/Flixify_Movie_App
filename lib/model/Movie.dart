class Movie {
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  Movie(
      {required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.voteCount});

  // factory method to create a Movie instance from a json object
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json['backdrop_path'] ?? "",
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'] ?? "",
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': this.backdropPath,
      'genre_ids': this.genreIds,
      'id': this.id,
      'original_language': this.originalLanguage,
      'original_title': this.originalTitle,
      'overview': this.overview,
      'popularity': this.popularity,
      'poster_path': this.posterPath,
      'release_date': this.releaseDate,
      'title': this.title,
      'vote_average': this.voteAverage,
      'vote_count': this.voteCount,
    };
  }
}
