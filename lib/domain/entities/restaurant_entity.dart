import 'package:equatable/equatable.dart';

class RestaurantEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String cuisineType;
  final double rating;
  final String address;
  final bool isOpen;

  const RestaurantEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.cuisineType,
    required this.rating,
    required this.address,
    required this.isOpen,
  });

  @override
  List<Object?> get props => [id, name, description, cuisineType, rating, address, isOpen];
}
