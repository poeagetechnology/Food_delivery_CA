import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_controller.dart';

class PriceBreakdown extends StatelessWidget {
  const PriceBreakdown({super.key});

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<CartController>(context);

    double subtotal = cart.totalPrice;
    double delivery = 20;
    double total = subtotal + delivery;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      child: Column(
        children: [

          _row("Subtotal", subtotal),
          _row("Delivery Fee", delivery),

          const Divider(),

          _row("Total", total, isBold: true),
        ],
      ),
    );
  }

  Widget _row(String title, double value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(title),

          Text(
            "₹${value.toStringAsFixed(0)}",
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}