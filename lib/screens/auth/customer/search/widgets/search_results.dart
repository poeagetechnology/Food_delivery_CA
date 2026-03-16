import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {

  final List<Map<String,String>> foods;

  const SearchResults({super.key, required this.foods});

  @override
  Widget build(BuildContext context) {

    if (foods.isEmpty) {
      return const Center(
        child: Text("No Results found"),
      );
    }

    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {

        final food = foods[index];

        return Container(
          margin: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 6,
              )
            ],
          ),
          child: Row(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  food["image"]!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Text(
                  food["name"]!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Icon(Icons.arrow_forward_ios, size: 16)
            ],
          ),
        );
      },
    );
  }
}