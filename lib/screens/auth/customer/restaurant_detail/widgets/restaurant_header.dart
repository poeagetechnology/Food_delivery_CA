import 'package:flutter/material.dart';

class RestaurantHeader extends StatelessWidget {

  final String image;
  final String name;

  const RestaurantHeader({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Image.network(
          image,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        const SizedBox(height: 10),

        Text(
          name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20)
      ],
    );
  }
}