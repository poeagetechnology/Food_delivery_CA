import 'package:equatable/equatable.dart';

class FoodEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;

  const FoodEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
  });

  @override
  List<Object?> get props => [id, name, description, price, rating];
}
