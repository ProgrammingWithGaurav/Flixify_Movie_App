import 'package:flixify_movie_app/pages/Home.dart';
import 'package:flixify_movie_app/palette/palette.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  // search controller
  final TextEditingController searchController = TextEditingController();
  MySearchBar({super.key});

  void searchMovies(BuildContext context) {
    // call the fetch
    // navigate to home page
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SearchBar(
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
              (states) =>
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            controller: searchController,
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Colors.white.withOpacity(0.1)),
            leading: Icon(Icons.search, color: Colors.grey.shade500, size: 32),
            hintText: "Find Movies, TV Shows and more...",
            hintStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                (states) => TextStyle(color: Colors.grey.shade500))),

        // Search Button
        TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Palette.blueAccent),
                padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
                    (states) => const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15))),
            onPressed: () => searchMovies(context),
            child: Text("Search",
                style: TextStyle(color: Colors.white, fontSize: 20)))
      ],
    );
  }
}
