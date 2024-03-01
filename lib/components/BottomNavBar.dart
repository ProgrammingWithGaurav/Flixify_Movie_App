import 'package:flixify_movie_app/palette/palette.dart';
import 'package:flixify_movie_app/providers/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final List<Map<String, dynamic>> navs = [
    {
      "name": "Home",
      "icon": Icons.home,
    },
    {
      "name": "Watchlist",
      "icon": Icons.library_add,
    },
    {
      "name": "Search",
      "icon": Icons.search,
    },
    {
      "name": "Profile",
      "icon": Icons.person,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, value, child) => Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(217, 33, 33, 33),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Row(
              children: navs.asMap().entries.map((entry) {
                // getting each element
                int idx = entry.key;
                Map<String, dynamic> nav = entry.value;

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      value.changeActiveNav(nav['name']);
                      Navigator.pushNamed(context, '/${nav['name']}');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: nav['name'] == value.activeNav
                              ? Palette.blueAccent
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(nav['icon'], size: 32, color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            )));
  }
}
