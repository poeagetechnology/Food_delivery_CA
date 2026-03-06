import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {

  final List<String> categories;

  const CategoryFilter({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {

          return Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Text(
              categories[index],
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}