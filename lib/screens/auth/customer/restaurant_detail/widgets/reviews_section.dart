import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ReviewsSection extends StatelessWidget {

  final List<Map<String, dynamic>> reviews;

  const ReviewsSection({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

         Padding(
          padding: EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Reviews",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        ...reviews.map((review) => ListTile(
          leading: const Icon(Icons.person),
          title: Text(
            review["name"].toString(),
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ),
          ),

          subtitle: Text(
            review["comment"].toString(),
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ))
      ],
    );
  }
}