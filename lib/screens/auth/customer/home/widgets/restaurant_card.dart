import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;

  const RestaurantCard({
    super.key,
    required this.name,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.black54,
          padding: const EdgeInsets.all(6),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}