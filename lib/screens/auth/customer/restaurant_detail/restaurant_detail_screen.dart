import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/restaurant_header.dart';
import 'widgets/menu_section.dart';
import 'widgets/reviews_section.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String restaurantName;
  final String restaurantImage;
  final String restaurantId;

  const RestaurantDetailScreen({
    super.key,
    required this.restaurantName,
    required this.restaurantImage,
    required this.restaurantId,
  });

  /// 🔥 FETCH MENU FROM FIREBASE
  Future<List<Map<String, dynamic>>> fetchMenu() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('restaurants')
        .doc(restaurantId)
        .collection('menu')
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();

      return {
        "name": data["name"] ?? "",
        "price": "₹${data["price"] ?? 0}",
        "image": data["image"] ?? "",
        "rating": data.containsKey("rating") ? data["rating"] : 0,
      };
    }).toList();
  }

  /// 🔥 FETCH REVIEWS FROM FIREBASE
  Future<List<Map<String, dynamic>>> fetchReviews() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('restaurants')
        .doc(restaurantId)
        .collection('reviews')
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();

      return {
        "name": data["name"] ?? "",
        "comment": data["comment"] ?? "",
        "rating": data["rating"] ?? 0,
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantName,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔝 HEADER
            RestaurantHeader(
              name: restaurantName,
              image: restaurantImage,
            ),

            const SizedBox(height: 20),

            /// 🍽 MENU SECTION
            FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchMenu(),
              builder: (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Center(child: Text("Error loading menu"));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No menu available"));
                }

                return MenuSection(menu: snapshot.data!);
              },
            ),

            const SizedBox(height: 20),

            /// ⭐ REVIEWS TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Customer Reviews",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// ⭐ REVIEWS SECTION
            FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchReviews(),
              builder: (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Center(child: Text("Error loading reviews"));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("No reviews yet"),
                  );
                }

                return ReviewsSection(
                  reviews: snapshot.data!,
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}