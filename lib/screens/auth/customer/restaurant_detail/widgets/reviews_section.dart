import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {

  final List<Map<String, String>> reviews;

  const ReviewsSection({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        const Padding(
          padding: EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Reviews",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        ...reviews.map((review) => ListTile(
          leading: const Icon(Icons.person),
          title: Text(review["user"]!),
          subtitle: Text(review["comment"]!),
        ))
      ],
    );
  }
}