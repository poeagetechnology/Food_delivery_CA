import 'package:flutter/material.dart';

class RestaurantDetailController extends ChangeNotifier {

  String restaurantName = "Arabian Mandi House";
  String restaurantImage = "assets/images/restaurant.jpg";

  List<Map<String, dynamic>> menu = [
    {
      "name": "Grill Chicken",
      "price": "₹320",
      "image": "assets/images/grilly.jpg"
    },
    {
      "name": "Mutton Curry",
      "price": "₹280",
      "image": "assets/images/mutton_curry.jpg"
    },
    {
      "name": "Chicken Noodles",
      "price": "₹120",
      "image": "assets/images/img.png"
    },
    {
      "name": "Shawarma",
      "price": "₹100",
      "image": "assets/images/shawarma.png"
},
    {
      "name": "Panneer Butter masala",
      "price": "₹100",
      "image": "assets/images/panneer.png"
    },
    {
      "name": "Chicken Lollipop",
      "price": "₹160",
      "image": "assets/images/lollipop.png"
    }
  ];

  List<Map<String, String>> reviews = [
    {
      "user": "Rahul",
      "comment": "Food was amazing!"
    },
    {
      "user": "Arun",
      "comment": "Best mandi in town."
    }
  ];
}