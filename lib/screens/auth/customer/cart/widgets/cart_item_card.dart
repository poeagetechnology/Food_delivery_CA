import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_controller.dart';

class CartItemCard extends StatelessWidget {

  final Map<String, dynamic> item;
  final int index;

  const CartItemCard({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<CartController>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Row(
        children: [

          /// 🍗 IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item["image"],
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 10),

          /// 📝 DETAILS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  item["name"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "₹${item["price"]}",
                  style: const TextStyle(
                    color: Colors.orange,
                  ),
                ),

                const SizedBox(height: 5),

                /// 🔢 QUANTITY
                Row(
                  children: [

                    GestureDetector(
                      onTap: () {
                        cart.decreaseQty(index);
                      },
                      child: const Icon(Icons.remove_circle_outline),
                    ),

                    const SizedBox(width: 10),

                    Text(item["qty"].toString()),

                    const SizedBox(width: 10),

                    GestureDetector(
                      onTap: () {
                        cart.increaseQty(index);
                      },
                      child: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                )
              ],
            ),
          ),

          /// 🗑 DELETE
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              cart.removeFromCart(index);
            },
          )
        ],
      ),
    );
  }
}