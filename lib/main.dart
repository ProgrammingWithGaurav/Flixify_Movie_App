import 'package:flixify_movie_app/components/Profile.dart';
import 'package:flixify_movie_app/components/Watchlist.dart';
import 'package:flixify_movie_app/pages/Home.dart';
import 'package:flixify_movie_app/pages/Search.dart';
import 'package:flixify_movie_app/providers/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => HomeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          '/Home': (context) => HomePage(),
          '/Search': (context) => SearchPage(),
          '/Watchlist': (context) => WatchlistPage(),
          '/Profile': (context) => ProfilePage(),
        });
  }
}
