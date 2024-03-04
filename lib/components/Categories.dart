import 'package:flixify_movie_app/palette/palette.dart';
import 'package:flixify_movie_app/providers/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flixify_movie_app/utils/utils.dart';

class Categories extends StatelessWidget {
  Categories({super.key});
  @override
  Widget build(BuildContext context) {
    // scrollable list of categories
    return Consumer<HomeProvider>(
        builder: (context, value, child) => Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    return GestureDetector(
                      onTap: () => value
                          .changeActiveCategory(categories[index]['title']!),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              categories[index]['title'] == value.activeCategory
                                  ? Palette.blueAccent
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: Text(
                            categories[index]['title'],
                            style: TextStyle(
                              fontSize: 18,
                              color: categories[index]['title'] ==
                                      value.activeCategory
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
