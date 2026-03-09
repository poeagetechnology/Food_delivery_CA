import 'package:equatable/equatable.dart';

class RestaurantModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String cuisineType;
  final double rating;
  final String address;
  final String phoneNumber;
  final String? image;
  final bool isOpen;
  final double deliveryTime;
  final double deliveryCharge;
  final int reviewCount;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.cuisineType,
    required this.rating,
    required this.address,
    required this.phoneNumber,
    this.image,
    required this.isOpen,
    required this.deliveryTime,
    required this.deliveryCharge,
    required this.reviewCount,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      cuisineType: json['cuisineType'],
      rating: (json['rating'] as num).toDouble(),
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      image: json['image'],
      isOpen: json['isOpen'],
      deliveryTime: (json['deliveryTime'] as num).toDouble(),
      deliveryCharge: (json['deliveryCharge'] as num).toDouble(),
      reviewCount: json['reviewCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'cuisineType': cuisineType,
      'rating': rating,
      'address': address,
      'phoneNumber': phoneNumber,
      'image': image,
      'isOpen': isOpen,
      'deliveryTime': deliveryTime,
      'deliveryCharge': deliveryCharge,
      'reviewCount': reviewCount,
    };
  }

  @override
  List<Object?> get props => [
    id, name, description, cuisineType, rating, address, phoneNumber, image, isOpen, deliveryTime, deliveryCharge, reviewCount
  ];
}
