import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:customer_mobile_app/screens/auth/customer/cart/cart_controller.dart';

class FoodDetailScreen extends StatefulWidget {
  final String name;
  final String price;
  final String rating;
  final String image;
  final String description;

  const FoodDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.rating,
    required this.image,
    required this.description,
  });

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {

  int quantity = 1;

  @override
  Widget build(BuildContext context) {

    // Convert price string to int
    int priceValue =
    int.parse(widget.price.replaceAll("₹", "").trim());

    int totalPrice = priceValue * quantity;

    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Column(
        children: [

          /// FOOD IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30)),
            child: Image.network(
              widget.image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace){
                return const Icon(Icons.broken_image, size:50);
              },
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// FOOD NAME
                  Text(
                    widget.name,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// PRICE + RATING
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.price,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange),
                          const SizedBox(width: 4),
                          Text(widget.rating),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// DESCRIPTION
                  Text(
                    widget.description,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// QUANTITY SELECTOR
                  Row(
                    children: [

                      const Text(
                        "Quantity:",
                        style: TextStyle(
                            fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(width: 15),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey),
                        ),
                        child: Row(
                          children: [

                            IconButton(
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                              icon: const Icon(Icons.remove),
                            ),

                            Text(
                              quantity.toString(),
                              style: const TextStyle(
                                  fontSize: 16),
                            ),

                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// TOTAL PRICE
                  Text(
                    "Total: ₹ $totalPrice",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),

                  const Spacer(),

                  /// ADD TO CART BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        final cart = Provider.of<CartController>(context, listen: false);

                        cart.addToCart({
                          "name": widget.name,
                          "price": int.parse(widget.price.replaceAll("₹", "").trim()),
                          "image": widget.image,
                          "quantity": quantity,
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Added to Cart"),
                            backgroundColor: Colors.orange,
                          ),
                        );

                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Add To Cart",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}