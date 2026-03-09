import 'package:equatable/equatable.dart';

class RestaurantOwnerModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String restaurantName;
  final String? licenseNumber;
  final String? licenseImage;
  final String status; // 'pending', 'approved', 'rejected'
  final DateTime createdAt;

  const RestaurantOwnerModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.restaurantName,
    this.licenseNumber,
    this.licenseImage,
    required this.status,
    required this.createdAt,
  });

  factory RestaurantOwnerModel.fromJson(Map<String, dynamic> json) {
    return RestaurantOwnerModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      restaurantName: json['restaurantName'],
      licenseNumber: json['licenseNumber'],
      licenseImage: json['licenseImage'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'restaurantName': restaurantName,
      'licenseNumber': licenseNumber,
      'licenseImage': licenseImage,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
    id, name, email, phoneNumber, restaurantName, licenseNumber, licenseImage, status, createdAt
  ];
}
