class Movie {
  final int id;
  final String? title;
  final String? coverUrl;
  final String? directedBy;
  final String? trailerUrl;
  final String? releaseDate;
  final String? overview;

  Movie({
    required this.id,
    required this.title,
    required this.coverUrl,
    required this.directedBy,
    required this.trailerUrl,
    required this.releaseDate,
    required this.overview,
  });
}
