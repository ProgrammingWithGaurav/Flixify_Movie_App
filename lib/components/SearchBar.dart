import 'package:flixify_movie_app/palette/palette.dart';
import 'package:flixify_movie_app/providers/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySearchBar extends StatefulWidget {
  MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  // search controller
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: SearchBar(
                padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
                  (states) =>
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                controller: searchController,
                textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                    (states) => TextStyle(color: Colors.white)),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.white.withOpacity(0.1)),
                leading:
                    Icon(Icons.search, color: Colors.grey.shade500, size: 32),
                hintText: "Find Movies, TV Shows and more...",
                hintStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                    (states) => TextStyle(color: Colors.grey.shade500))),
          ),

          // Search Button
          GestureDetector(
            onTap: () {
              // call the fetch
              if (searchController.text.isNotEmpty) {
                // fetch movies
                value.changeSearch(searchController.text);
                // call the search function
                value.findMovies(searchController.text);
                // clear the search
                searchController.clear();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Palette.blueAccent,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(Icons.search, color: Colors.white, size: 32),
            ),
          )
        ],
      );
    });
  }
}
