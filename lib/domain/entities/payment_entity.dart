import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable {
  final String id;
  final double amount;
  final String method;
  final String status;
  final DateTime createdAt;

  const PaymentEntity({
    required this.id,
    required this.amount,
    required this.method,
    required this.status,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, amount, method, status, createdAt];
}
