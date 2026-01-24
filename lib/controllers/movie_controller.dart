import 'package:state_extended/state_extended.dart';
import '../models/movie.dart';
import '../models/movie_detail.dart';
import '../services/api_service.dart';
import '../hive/hive_boxes.dart';

class MovieController extends StateXController {
  final ApiService _api = ApiService();

  List<Movie> movies = [];
  bool isLoading = false;

  Future<void> search(String query) async {
    isLoading = true;
    setState(() {});

    movies = await _api.searchMovies(query);

    final box = HiveBoxes.movieBox();
    await box.clear();
    for (var m in movies) {
      box.put(m.imdbId, m);
    }

    isLoading = false;
    setState(() {});
  }

  void loadCachedMovies() {
    movies = HiveBoxes.movieBox().values.toList();
    setState(() {});
  }

  Future<MovieDetail> getMovieDetail(String id) async {
    final box = HiveBoxes.movieDetailBox();

    if (box.containsKey(id)) {
      return box.get(id)!;
    }

    final detail = await _api.getMovieDetail(id);
    box.put(id, detail);
    return detail;
  }
}
