import 'package:flixify_movie_app/model/Movie.dart';
import 'package:flixify_movie_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HomeProvider extends ChangeNotifier {
  String _activeCategory = "Top Rated";
  String _activeNav = "Home";
  List<Movie> _movies = [];

  String get activeCategory => _activeCategory;
  String get activeNav => _activeNav;
  List<Movie> get movies => _movies;

  // setter
  void changeActiveNav(String nav) {
    _activeNav = nav;
    notifyListeners();
  }

  void changeActiveCategory(String cat) {
    _activeCategory = cat;
    notifyListeners();
  }

  Future fetchMovies(String category) async {
    String category_url = getMovieUrl(category);
    String url = "https://api.themoviedb.org/3$category_url";
    try {
      final response = await get(Uri.parse(url));

      // if loading
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Movie> movies = [];
        for (var movie in data['results']) {
          movies.add(Movie.fromJson(movie));
        }
        _movies = movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
