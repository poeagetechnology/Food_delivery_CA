import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  final List<Map<String, dynamic>> foods;

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
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

              /// 🔥 IMAGE (FROM FIREBASE)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  food["image"].toString(),
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 15),

              /// 🔥 DETAILS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// FOOD NAME
                    Text(
                      food["name"].toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 4),

                    /// PRICE
                    Text(
                      "₹${food["price"]}",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 2),

                    /// RESTAURANT NAME
                    Text(
                      food["restaurant"].toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        );
      },
    );
  }
}