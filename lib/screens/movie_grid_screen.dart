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
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26, // Slightly bigger
            letterSpacing: 1.5, // Modern spacing
            color: Colors.white,
          ),
        ),
        centerTitle: true, // Centers the title
        elevation: 4, // Subtle shadow
        backgroundColor: Colors.deepPurpleAccent, // Modern color
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Rounded bottom corners
          ),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              onSubmitted: controller.search,
              decoration: InputDecoration(
                hintText: 'Search movie...',
                filled: true,
                fillColor: Colors.grey[200], // Light background
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none, // Remove default border
                ),
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ),
          Expanded(
            child: controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : controller.movies.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'No movies found. Search for a movie by name.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
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
