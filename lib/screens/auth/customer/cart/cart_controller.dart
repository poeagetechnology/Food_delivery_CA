import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {

  /// 🛒 CART LIST
  List<Map<String, dynamic>> cartItems = [];

  /// ➕ ADD TO CART
  void addToCart(Map<String, dynamic> item) {

    final index = cartItems.indexWhere(
          (i) => i["name"] == item["name"],
    );

    if (index >= 0) {
      /// already exists → increase qty
      cartItems[index]["qty"] += 1;
    } else {
      /// new item
      item["qty"] = 1;
      cartItems.add(item);
    }

    notifyListeners();
  }

  /// ❌ REMOVE ITEM
  void removeFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  /// ➕ INCREASE QTY
  void increaseQty(int index) {
    cartItems[index]["qty"] += 1;
    notifyListeners();
  }

  /// ➖ DECREASE QTY
  void decreaseQty(int index) {
    if (cartItems[index]["qty"] > 1) {
      cartItems[index]["qty"] -= 1;
    } else {
      cartItems.removeAt(index);
    }
    notifyListeners();
  }

  /// 💰 TOTAL PRICE
  double get totalPrice {
    double total = 0;

    for (var item in cartItems) {
      final price = double.tryParse(item["price"].toString()) ?? 0;
      final qty = item["qty"] ?? 1;

      total += price * qty;
    }

    return total;
  }

  /// 🧹 CLEAR CART (after order)
  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }
}