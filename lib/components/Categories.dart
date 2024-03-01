import 'package:flixify_movie_app/palette/palette.dart';
import 'package:flixify_movie_app/providers/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> categories = [
  "All",
  "Action",
  "Comedy",
  "Drama",
  "Horror",
  "Kids",
  "Animation",
];

class Categories extends StatelessWidget {
  Categories({super.key});
  @override
  Widget build(BuildContext context) {
    // scrollable list of categories
    return Consumer<HomeProvider>(
        builder: (context, value, child) => Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    return GestureDetector(
                      onTap: () =>
                          value.changeActiveCategory(categories[index]),
                      child: Container(
                        decoration: BoxDecoration(
                          color: categories[index] == value.activeCategory
                              ? Palette.blueAccent
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              fontSize: 18,
                              color: categories[index] == value.activeCategory
                                  ? Colors.white
                                  : Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ));
  }
}
