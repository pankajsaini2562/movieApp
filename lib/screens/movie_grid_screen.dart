import 'package:flutter/material.dart';
import 'package:state_extended/state_extended.dart';
import '../controllers/movie_controller.dart';
import '../widgets/movie_card.dart';

class MovieGridScreen extends StatefulWidget {
  const MovieGridScreen({super.key});

  @override
  State createState() => _MovieGridState();
}

class _MovieGridState extends StateX<MovieGridScreen> {
  _MovieGridState() : super(controller: MovieController());
  MovieController get controller => super.controller as MovieController;

  @override
  void initState() {
    super.initState();
    controller.loadCachedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onSubmitted: controller.search,
              decoration: const InputDecoration(
                hintText: 'Search movie...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .65,
                        ),
                    itemCount: controller.movies.length,
                    itemBuilder: (_, i) =>
                        MovieCard(movie: controller.movies[i]),
                  ),
          ),
        ],
      ),
    );
  }
}
