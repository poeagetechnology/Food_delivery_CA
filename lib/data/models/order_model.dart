import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final String id;
  final String userId;
  final String restaurantId;
  final List<OrderItemModel> items;
  final double totalAmount;
  final double deliveryCharge;
  final double discount;
  final String status;
  final String deliveryAddress;
  final DateTime createdAt;
  final DateTime? deliveredAt;

  const OrderModel({
    required this.id,
    required this.userId,
    required this.restaurantId,
    required this.items,
    required this.totalAmount,
    required this.deliveryCharge,
    required this.discount,
    required this.status,
    required this.deliveryAddress,
    required this.createdAt,
    this.deliveredAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userId: json['userId'],
      restaurantId: json['restaurantId'],
      items: List<OrderItemModel>.from(
        json['items'].map((e) => OrderItemModel.fromJson(e)),
      ),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      deliveryCharge: (json['deliveryCharge'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      status: json['status'],
      deliveryAddress: json['deliveryAddress'],
      createdAt: DateTime.parse(json['createdAt']),
      deliveredAt: json['deliveredAt'] != null ? DateTime.parse(json['deliveredAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'restaurantId': restaurantId,
      'items': items.map((e) => e.toJson()).toList(),
      'totalAmount': totalAmount,
      'deliveryCharge': deliveryCharge,
      'discount': discount,
      'status': status,
      'deliveryAddress': deliveryAddress,
      'createdAt': createdAt.toIso8601String(),
      'deliveredAt': deliveredAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
    id, userId, restaurantId, items, totalAmount, deliveryCharge, discount, status, deliveryAddress, createdAt, deliveredAt
  ];
}

class OrderItemModel extends Equatable {
  final String foodId;
  final String foodName;
  final int quantity;
  final double price;
  final double total;

  const OrderItemModel({
    required this.foodId,
    required this.foodName,
    required this.quantity,
    required this.price,
    required this.total,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      foodId: json['foodId'],
      foodName: json['foodName'],
      quantity: json['quantity'],
      price: (json['price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodId': foodId,
      'foodName': foodName,
      'quantity': quantity,
      'price': price,
      'total': total,
    };
  }

  @override
  List<Object?> get props => [foodId, foodName, quantity, price, total];
}
