import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
          (states) => const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
            (states) => Colors.white.withOpacity(0.1)),
        leading: Icon(Icons.search, color: Colors.grey.shade500, size: 32),
        hintText: "Find Movies, TV Shows and more...",
        hintStyle: MaterialStateProperty.resolveWith<TextStyle?>(
            (states) => TextStyle(color: Colors.grey.shade500)));
  }
}
