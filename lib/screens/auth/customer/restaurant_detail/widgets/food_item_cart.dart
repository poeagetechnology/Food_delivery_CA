import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItemCard extends StatelessWidget {

  final String name;
  final String price;
  final String image;
  final dynamic rating;

  const FoodItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
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
                child: Image.network(
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
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  price,
                  style: GoogleFonts.poppins(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      rating.toString(),
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                  ],
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}