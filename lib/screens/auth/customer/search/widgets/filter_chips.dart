import 'package:flutter/material.dart';

class FilterChips extends StatelessWidget {

  final List<String> filters = [
    "All",
    "Veg",
    "Non-Veg",
    "Drinks",
    "Desserts"
  ];

  FilterChips({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {

          return Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Chip(
              label: Text(filters[index]),
              backgroundColor: Colors.orange.shade100,
            ),
          );
        },
      ),
    );
  }
}