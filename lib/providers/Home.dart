import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String _activeCategory = "All";
  String _activeNav = "Home";

  String get activeCategory => _activeCategory;
  String get activeNav => _activeNav;

  // setter
  void changeActiveNav(String nav) {
    _activeNav = nav;
    notifyListeners();
  }

  void changeActiveCategory(String cat) {
    _activeCategory = cat;
    notifyListeners();
  }
}
