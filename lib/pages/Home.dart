import 'package:firebase_auth/firebase_auth.dart';
import 'package:flixify_movie_app/components/Categories.dart';
import 'package:flixify_movie_app/components/MovieCard.dart';
import 'package:flixify_movie_app/providers/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/BottomNavBar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get user
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, child) {
      value.fetchMovies(value.activeCategory);
      return Scaffold(
        appBar: AppBar(
          title: Text("Flixify",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              // make the image rounded
              icon: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(user?.photoURL ?? "", width: 40)),

              onPressed: () {
                // go to profile page
                Navigator.pushNamed(context, "/Profile");
              },
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            // movie category
            Categories(),
            // movie list
            Expanded(
              child: ListView.builder(
                itemCount: value.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return MovieCard(
                    movie: value.movies[index],
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      );
    });
  }
}
