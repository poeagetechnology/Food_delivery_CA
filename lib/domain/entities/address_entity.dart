import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String id;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final double latitude;
  final double longitude;

  const AddressEntity({
    required this.id,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [id, street, city, state, postalCode, latitude, longitude];
}
