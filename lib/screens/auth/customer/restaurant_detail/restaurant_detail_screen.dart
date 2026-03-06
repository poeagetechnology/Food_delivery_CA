import 'package:flutter/material.dart';

class RestaurantMenuScreen extends StatelessWidget {
  final String restaurantName;
  final String restaurantImage;
  final List<Map<String, dynamic>> foods;

  const RestaurantMenuScreen({
    super.key,
    required this.restaurantName,
    required this.restaurantImage,
    required this.foods,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantName),
      ),
      body: Column(
        children: [
          Image.asset(restaurantImage, height: 150, fit: BoxFit.cover),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.75),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to Food Detail page
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20)),
                          child: Image.asset(
                            food["image"],
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(food["name"]),
                              Text(food["price"],
                                  style: const TextStyle(color: Colors.orange)),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.orange, size: 16),
                                  Text(food["rating"]),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}