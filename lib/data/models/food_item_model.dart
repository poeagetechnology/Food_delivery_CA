import 'package:equatable/equatable.dart';

class FoodItemModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String? image;
  final double rating;
  final int reviewCount;
  final bool isVegetarian;
  final bool isSpicy;
  final String restaurantId;

  const FoodItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    this.image,
    required this.rating,
    required this.reviewCount,
    required this.isVegetarian,
    required this.isSpicy,
    required this.restaurantId,
  });

  factory FoodItemModel.fromJson(Map<String, dynamic> json) {
    return FoodItemModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
      image: json['image'],
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'],
      isVegetarian: json['isVegetarian'],
      isSpicy: json['isSpicy'],
      restaurantId: json['restaurantId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'image': image,
      'rating': rating,
      'reviewCount': reviewCount,
      'isVegetarian': isVegetarian,
      'isSpicy': isSpicy,
      'restaurantId': restaurantId,
    };
  }

  @override
  List<Object?> get props => [
    id, name, description, price, category, image, rating, reviewCount, isVegetarian, isSpicy, restaurantId
  ];
}
