import 'package:flixify_movie_app/components/MovieCard.dart';
import 'package:flixify_movie_app/components/SearchBar.dart';
import 'package:flixify_movie_app/providers/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, child) {
      value.findMovies(value.search);
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "Search",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            // search bar
            MySearchBar(),

            // search text
            value.search.length > 0
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Search Results for ${value.search}",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                : Text(""),

            // search results
            value.searchMovies.length > 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: value.searchMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MovieCard(
                          movie: value.searchMovies[index],
                        );
                      },
                    ),
                  )
                : Text(""),
          ]),
        ),
      );
    });
  }
}
