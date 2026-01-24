import 'package:hive/hive.dart';

part 'movie_detail.g.dart';

@HiveType(typeId: 1)
class MovieDetail extends HiveObject {
  @HiveField(0)
  final String imdbID;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String plot;

  @HiveField(3)
  final String poster;

  @HiveField(4)
  final String year;

  MovieDetail({
    required this.imdbID,
    required this.title,
    required this.plot,
    required this.poster,
    required this.year,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      imdbID: json['imdbID'] ?? '',
      title: json['Title'] ?? 'No Title',
      plot: json['Plot'] != null && json['Plot'] != 'N/A'
          ? json['Plot']
          : 'No description available',
      poster: json['Poster'] != null && json['Poster'] != 'N/A'
          ? json['Poster']
          : '',
      year: json['Year'] != null && json['Year'] != 'N/A' ? json['Year'] : '',
    );
  }
}
