import 'package:flutter/material.dart';

class SearchControllerProvider extends ChangeNotifier {

  final List<Map<String, String>> foods = [
    {"name": "Chicken Biryani", "image": "assets/images/biryanii.png"},
    {"name": "Pizza", "image": "assets/images/piz.png"},
    {"name": "Burger", "image": "assets/images/burger.jpg"},
    {"name": "Meals", "image": "assets/images/meals.jpg"},
    {"name": "Shakes", "image": "assets/images/cold.jpg"},
    {"name": "Cakes", "image": "assets/images/cakess.png"},
    {"name": "Fried Rice", "image": "assets/images/fried.jpg"},
    {"name": "Noodles", "image": "assets/images/noodles.jpg"},
  ];

  List<Map<String, String>> filteredFoods = [];

  SearchControllerProvider() {
    filteredFoods = foods;
  }

  void searchFood(String query) {

    if (query.isEmpty) {
      filteredFoods = foods;
    } else {
      filteredFoods = foods.where((food) {
        final name = food["name"]!.toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
    }

    notifyListeners();
  }
}




































