import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/movie.dart';
import 'models/movie_detail.dart';
import 'screens/movie_grid_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(MovieAdapter());
  Hive.registerAdapter(MovieDetailAdapter());

  await Hive.openBox<Movie>('movies');
  await Hive.openBox<MovieDetail>('movie_details');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieGridScreen(),
    );
  }
}
