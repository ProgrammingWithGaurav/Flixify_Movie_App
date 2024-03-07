import 'package:flixify_movie_app/model/Movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HomeProvider extends ChangeNotifier {
  String _activeCategory = "Top Rated";
  String _activeNav = "Home";
  List<Movie> _movies = [];
  List<Movie> _searchMovies = [];
  String _search = "";

  String get activeCategory => _activeCategory;
  String get activeNav => _activeNav;
  List<Movie> get movies => _movies;
  List<Movie> get searchMovies => _searchMovies;
  String get search => _search;

  // setter
  void changeActiveNav(String nav) {
    _activeNav = nav;
    notifyListeners();
  }

  void changeActiveCategory(String cat) {
    _activeCategory = cat;
    notifyListeners();
  }

  void changeSearch(String search) {
    _search = search;
    notifyListeners();
  }

  Future fetchMovies(String category) async {
    try {
      String url = "https://movie-tmdb-api.onrender.com/movies/$category";
      final response = await get(Uri.parse(url));
      // if loading
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Movie> movies = [];
        for (var movie in data) {
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

  // search

  Future findMovies() async {
    if (_search == "") return;
    final url = "https://movie-tmdb-api.onrender.com/search/$_search";
    final response = await get(Uri.parse(url));

    // if loading
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Movie> moviesSearch = [];
        for (var movie in data) {
          moviesSearch.add(Movie.fromJson(movie));
        }
        _searchMovies = moviesSearch;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
