import 'package:equatable/equatable.dart';

class PaymentModel extends Equatable {
  final String id;
  final String orderId;
  final double amount;
  final String method; // 'card', 'upi', 'wallet', etc.
  final String status; // 'pending', 'completed', 'failed'
  final DateTime createdAt;
  final String transactionId;

  const PaymentModel({
    required this.id,
    required this.orderId,
    required this.amount,
    required this.method,
    required this.status,
    required this.createdAt,
    required this.transactionId,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      orderId: json['orderId'],
      amount: (json['amount'] as num).toDouble(),
      method: json['method'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      transactionId: json['transactionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderId': orderId,
      'amount': amount,
      'method': method,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'transactionId': transactionId,
    };
  }

  @override
  List<Object?> get props => [id, orderId, amount, method, status, createdAt, transactionId];
}
