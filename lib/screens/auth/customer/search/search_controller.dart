import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchControllerProvider extends ChangeNotifier {


    List<Map<String, dynamic>> allFoods = [];
    List<Map<String, dynamic>> filteredFoods = [];

    Future<void> fetchAllFoods() async {
      List<Map<String, dynamic>> tempFoods = [];

      final restaurantSnapshot =
          await FirebaseFirestore.instance.collection('restaurants').get();

      for (var restaurant in restaurantSnapshot.docs) {
        final menuSnapshot = await FirebaseFirestore.instance
            .collection('restaurants')
            .doc(restaurant.id)
            .collection('menu')
            .get();



      for (var item in menuSnapshot.docs){
        final data = item.data();

        tempFoods.add({
          "name": data["name"] ?? "",
          "image": data["image"] ?? "",
          "price": data["price"] ?? "",
          "restaurant": restaurant["name"] ?? "",
          "category": data["category"] ?? ""
        });
        }
      }

      allFoods = tempFoods;
      filteredFoods = tempFoods;

      notifyListeners();
    }

      void searchFood (String query){
        if (query.isEmpty){
          filteredFoods = allFoods;
        } else{
          filteredFoods = allFoods.where((food){
            final name = food["name"].toString().toLowerCase();
            return name.contains(query.toLowerCase());
          }).toList();
        }
        notifyListeners();
      }

    void filterByCategory(String category){
      if (category == "all") {
        filteredFoods = allFoods;
      } else {
        filteredFoods = allFoods.where((food){
          return food["category"] == category;
        }).toList();
      }
      notifyListeners();
    }

  }






































