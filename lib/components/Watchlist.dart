import 'package:flixify_movie_app/components/MovieCard.dart';
import 'package:flixify_movie_app/providers/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchlistPage extends StatefulWidget {
  WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).fetchWatchlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("Watchlist", style: TextStyle(color: Colors.white)),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // watchlist
                  Text("Your Favorite Movies " + "(${value.watchlist.length})",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  // watchlist movies
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.watchlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MovieCard(
                          movie: value.watchlist[index],
                        );
                      },
                    ),
                  ),
                ],
              )));
    });
  }
}
