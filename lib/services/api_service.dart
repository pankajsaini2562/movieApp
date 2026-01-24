import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import '../models/movie_detail.dart';

class ApiService {
  static const _apiKey = '7095820c';

  Future<List<Movie>> searchMovies(String query) async {
    final res = await http.get(
      Uri.parse('https://omdbapi.com/?s=$query&apikey=$_apiKey'),
    );

    final data = json.decode(res.body);
    if (data['Search'] == null) return [];

    return (data['Search'] as List).map((e) => Movie.fromJson(e)).toList();
  }

  Future<MovieDetail> getMovieDetail(String imdbId) async {
    final url = Uri.parse(
      'https://www.omdbapi.com/?i=$imdbId&apikey=$_apiKey&plot=full',
    );

    final res = await http.get(url);
    print('Movie Detail API Response: ${res.body}');
    if (res.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(res.body);

      if (jsonData['Response'] == 'True') {
        return MovieDetail.fromJson(jsonData);
      } else {
        throw Exception('OMDb API error: ${jsonData['Error']}');
      }
    } else {
      throw Exception('Failed to load movie detail: HTTP ${res.statusCode}');
    }
  }
}
