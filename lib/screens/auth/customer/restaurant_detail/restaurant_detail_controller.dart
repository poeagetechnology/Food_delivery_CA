import 'package:flutter/material.dart';

class RestaurantDetailController extends ChangeNotifier {

  /// ⭐ REVIEWS (static for now)
  List<Map<String, String>> reviews = [
    {
      "user": "Rahul",
      "comment": "Food was amazing!"
    },
    {
      "user": "Arun",
      "comment": "Best mandi in town."
    },
    {
      "user": "Kumar",
      "comment": "Nice ambience and tasty food."
    }
  ];

}