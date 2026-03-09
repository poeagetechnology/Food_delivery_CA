import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String? profileImage;
  final String role;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.profileImage,
    required this.role,
  });

  @override
  List<Object?> get props => [id, name, email, phoneNumber, profileImage, role];
}
