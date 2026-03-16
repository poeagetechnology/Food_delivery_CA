import 'package:flutter/material.dart';

class FoodItemCard extends StatelessWidget {

  final String name;
  final String price;
  final String image;

  const FoodItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Stack(
            children: [

              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                right: 10,
                top: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.orange,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    Text("4.8"),
                    SizedBox(width: 10),
                    Icon(Icons.timer, size: 16),
                    Text("20-25 Min")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}