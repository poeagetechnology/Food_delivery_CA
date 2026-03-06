import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final List<String> foods = [
    "Chicken Biryani",
    "Pizza",
    "Burger",
    "Meals",
    "Shakes",
    "Cakes",
    "Fried Rice",
    "Noodles"
  ];

  List<String> filteredFoods = [];

  @override
  void initState() {
    super.initState();
    filteredFoods = foods;
  }

  void searchFood(String query) {
    final results = foods.where((food) {
      return food.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredFoods = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Food"),
        centerTitle: true,
      ),
      body: Column(
        children: [

          // Search Field
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: searchFood,
              decoration: InputDecoration(
                hintText: "Search food...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // Search Results
          Expanded(
            child: ListView.builder(
              itemCount: filteredFoods.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.fastfood),
                  title: Text(filteredFoods[index]),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}