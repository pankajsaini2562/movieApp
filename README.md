# movie_app
Movie App (Flutter)

A Flutter application that fetches movies from the OMDb API, displays them in a grid, and allows viewing detailed information including poster, year, and plot. The app uses Hive for local storage and CachedNetworkImage for efficient image loading.

## Getting Started

This project is a starting point for a Flutter application.

Features

Browse movies with posters and titles.

Search movies (optional if implemented).

View detailed movie information (poster, title, year, plot).

Handles missing images or data gracefully.

Uses Hive for local data caching.

Efficient image caching with cached_network_image.

Screenshot- 




<img width="254" height="522" alt="image" src="https://github.com/user-attachments/assets/d14a43eb-c683-4b0e-9e64-8c4205de15f7" />

<img width="248" height="509" alt="image" src="https://github.com/user-attachments/assets/deae4620-793a-4c30-b659-62f8a5eb22cb" />




Getting Started

Follow these steps to run the app locally:

1. Clone the repository
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO

2. Install dependencies
flutter pub get


3. Add your OMDb API key

Open lib/services/api_service.dart (or wherever your API key is stored)

Replace _apiKey with your key:

final String _apiKey = 'YOUR_OMDB_API_KEY';

4. Generate Hive adapters

If Hive is used for local storage, run:

flutter packages pub run build_runner build

5. Clean and run the app
flutter clean
flutter pub get
flutter run


Connect a physical device or run in an emulator.

The app should build and run with the movie grid.












































A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
