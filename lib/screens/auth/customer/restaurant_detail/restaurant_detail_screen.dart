import 'package:flutter/material.dart';
import 'restaurant_detail_controller.dart';
import 'widgets/restaurant_header.dart';
import 'widgets/menu_section.dart';
import 'widgets/reviews_section.dart';

class RestaurantDetailScreen extends StatelessWidget {

  final String restaurantName;
  final String restaurantImage;

  const RestaurantDetailScreen({
    super.key,
    required this.restaurantName,
    required this.restaurantImage,
  });

  @override
  Widget build(BuildContext context) {

    final controller = RestaurantDetailController();

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantName),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Restaurant Header Widget
            RestaurantHeader(
              name: restaurantName,
              image: restaurantImage,
            ),

            const SizedBox(height: 20),

            /// Menu Section Widget
            MenuSection(
              menu: controller.menu,
            ),

            const SizedBox(height: 20),

            /// Reviews Section Widget
            ReviewsSection(
              reviews: controller.reviews,
            ),

          ],
        ),
      ),
    );
  }
}