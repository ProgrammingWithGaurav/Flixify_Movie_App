List<Map<String, dynamic>> obj = [
  {
    "adult": false,
    "backdrop_path": "/meyhnvssZOPPjud4F1CjOb4snET.jpg",
    "genre_ids": [16, 28, 12, 35, 10751],
    "id": 940551,
    "original_language": "en",
    "original_title": "Migration",
    "overview":
        "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
    "popularity": 912.71,
    "poster_path": "/ldfCF9RhR40mppkzmftxapaHeTo.jpg",
    "release_date": "2023-12-06",
    "title": "Migration",
    "video": false,
    "vote_average": 7.614,
    "vote_count": 813
  }
];

class Movie {
  final bool adult;
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
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie(
      {required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  // factory method to create a Movie instance from a json object
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
