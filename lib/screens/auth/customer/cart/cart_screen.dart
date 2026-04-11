import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_controller.dart';
import 'widgets/cart_item_card.dart';
import 'widgets/price_breakdown.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),

      body: cart.cartItems.isEmpty
          ? const Center(
        child: Text("Your cart is empty"),
      )

          : Column(
        children: [

          /// 🧾 CART ITEMS LIST
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {

                final item = cart.cartItems[index];

                return CartItemCard(
                  item: item,
                  index: index,
                );
              },
            ),
          ),

          /// 💰 PRICE BREAKDOWN
          PriceBreakdown(),

          /// 🛒 PLACE ORDER BUTTON
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(

                onPressed: () {
                  /// 🔥 FOR NOW JUST CLEAR CART
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Order Placed")),
                  );

                  cart.cartItems.clear();
                  cart.notifyListeners();
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),

                child: const Text(
                  "Place Order",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}