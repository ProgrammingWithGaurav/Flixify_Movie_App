import 'dart:ffi';

import 'package:flixify_movie_app/components/Categories.dart';
import 'package:flixify_movie_app/components/MovieCard.dart';
import 'package:flixify_movie_app/providers/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/BottomNavBar.dart';

final List<Map<String, String>> movies = [
  {
    "title": "The Matrix",
    "imageUrl":
        "https://images.unsplash.com/photo-1709070511070-d5fd90a6a1d1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8fA%3D%3D",
    "description":
        "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers."
  },
  {
    "title": "The Matrix",
    "imageUrl":
        "https://images.unsplash.com/photo-1709070511070-d5fd90a6a1d1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8fA%3D%3D",
    "description":
        "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers."
  },
  {
    "title": "The Matrix",
    "imageUrl":
        "https://images.unsplash.com/photo-1709070511070-d5fd90a6a1d1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8fA%3D%3D",
    "description":
        "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers."
  },
  {
    "title": "The Matrix",
    "imageUrl":
        "https://images.unsplash.com/photo-1709070511070-d5fd90a6a1d1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8fA%3D%3D",
    "description":
        "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers."
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            icon: Icon(Icons.person, size: 40),
            onPressed: () {},
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
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieCard(
                  title: movies[index]["title"]!,
                  imageUrl: movies[index]["imageUrl"]!,
                  description: movies[index]["description"]!,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
