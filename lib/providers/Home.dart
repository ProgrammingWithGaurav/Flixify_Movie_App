import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flixify_movie_app/model/Movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HomeProvider extends ChangeNotifier {
  String _activeCategory = "Top Rated";
  String _activeNav = "Home";
  List<Movie> _movies = [];
  List<Movie> _searchMovies = [];
  List<Movie> _watchlist = [];
  String _search = "";

  String get activeCategory => _activeCategory;
  String get activeNav => _activeNav;
  List<Movie> get movies => _movies;
  List<Movie> get searchMovies => _searchMovies;
  List<Movie> get watchlist => _watchlist;
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

  Future findMovies(String movie) async {
    if (movie == "") return;
    try {
      final url = "https://movie-tmdb-api.onrender.com/search/$movie";
      final response = await get(Uri.parse(url));

      // if loading
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

  // watchlist

  final CollectionReference watchlistRef =
      FirebaseFirestore.instance.collection('FlixifyUserWatchlist');
  // user
  final user = FirebaseAuth.instance.currentUser;

  Future<void> addToWatchlist(Movie movie) async {
    try {
      // remove from the ui
      _watchlist.add(movie);
      // find the current user watchlist
      final watchlist = await watchlistRef.doc(user!.uid).get();
      // if watchlist exists
      // add a doc for the movie
      await watchlistRef
          .doc(user!.uid)
          .collection("watchlist")
          .doc(movie.id.toString())
          .set(movie.toJson());
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  // fetch movies
  Future fetchWatchlist() async {
    try {
      final watchlist =
          await watchlistRef.doc(user!.uid).collection("watchlist").get();
      List<Movie> movies = [];
      for (var movie in watchlist.docs) {
        movies.add(Movie.fromJson(movie.data() as Map<String, dynamic>));
      }
      _watchlist = movies;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  // check if a movie is in current user watchlist
  bool isInWatchlist(Movie movie) {
    return _watchlist.any((element) => element.id == movie.id);
  }

  // remove from watchlist
  Future<void> removeFromWatchlist(Movie movie) async {
    try {
      _watchlist.remove(movie);
      await watchlistRef
          .doc(user!.uid)
          .collection("watchlist")
          .doc(movie.id.toString())
          .delete();
    } catch (e) {
      print(e);
    }
  }

  notifyListeners();
}
