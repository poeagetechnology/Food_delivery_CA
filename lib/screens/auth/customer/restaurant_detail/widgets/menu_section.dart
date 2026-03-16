import 'package:flutter/material.dart';
import 'food_item_cart.dart';

class MenuSection extends StatelessWidget {

  final List<Map<String, dynamic>> menu;

  const MenuSection({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),

      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menu.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 0.75,
        ),

        itemBuilder: (context, index) {

          final item = menu[index];

          return FoodItemCard(
            name: item["name"],
            price: item["price"],
            image: item["image"],
          );
        },
      ),
    );
  }
}