import 'package:hive/hive.dart';
import '../models/movie.dart';
import '../models/movie_detail.dart';

class HiveBoxes {
  static Box<Movie> movieBox() => Hive.box<Movie>('movies');
  static Box<MovieDetail> movieDetailBox() =>
      Hive.box<MovieDetail>('movie_details');
}
