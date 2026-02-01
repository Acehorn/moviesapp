class Series {
  final String title;
  final String year;
  final String rating;
  final String plot;
  final String poster;

  Series({
    required this.title,
    required this.year,
    required this.rating,
    required this.plot,
    required this.poster,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      rating: json['imdbRating'] ?? '',
      plot: json['Plot'] ?? '',
      poster: json['Poster'] ?? '',
    );
  }
}
