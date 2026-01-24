import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  final String imdbId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String poster;

  Movie({required this.imdbId, required this.poster, required this.title});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      imdbId: json['imdbID'] ?? '',
      title: json['Title'] != null && json['Title'] != 'N/A'
          ? json['Title']
          : 'No Title',
      poster: json['Poster'] != null && json['Poster'] != 'N/A'
          ? json['Poster']
          : '',
    );
  }
}
