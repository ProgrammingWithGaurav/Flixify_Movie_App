import 'package:flixify_movie_app/components/SearchBar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          ]),
        ));
  }
}
