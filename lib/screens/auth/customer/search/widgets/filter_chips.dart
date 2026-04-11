import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../search_controller.dart';

class FilterChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SearchControllerProvider>(context, listen: false);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Row(
        children: [
          _chip("All", () => controller.filterByCategory("all")),
          _chip("Veg", () => controller.filterByCategory("Veg")),
          _chip("Non-veg", () => controller.filterByCategory("Non-veg")),
          _chip("Shakes", () => controller.filterByCategory("shakes")),
          _chip("Sweets", () => controller.filterByCategory("sweets")),
          _chip("Snacks", () => controller.filterByCategory("snacks")),
          _chip("Chaats", () => controller.filterByCategory("chaats")),
        ],
      ),
    );
  }

  Widget _chip(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

}