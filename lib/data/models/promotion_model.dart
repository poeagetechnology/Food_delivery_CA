import 'package:equatable/equatable.dart';

class PromotionModel extends Equatable {
  final String id;
  final String code;
  final String description;
  final double discountPercentage;
  final double discountAmount;
  final double minimumOrderAmount;
  final int maxUsage;
  final int usedCount;
  final DateTime validFrom;
  final DateTime validUntil;
  final bool isActive;

  const PromotionModel({
    required this.id,
    required this.code,
    required this.description,
    required this.discountPercentage,
    required this.discountAmount,
    required this.minimumOrderAmount,
    required this.maxUsage,
    required this.usedCount,
    required this.validFrom,
    required this.validUntil,
    required this.isActive,
  });

  factory PromotionModel.fromJson(Map<String, dynamic> json) {
    return PromotionModel(
      id: json['id'],
      code: json['code'],
      description: json['description'],
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      discountAmount: (json['discountAmount'] as num).toDouble(),
      minimumOrderAmount: (json['minimumOrderAmount'] as num).toDouble(),
      maxUsage: json['maxUsage'],
      usedCount: json['usedCount'],
      validFrom: DateTime.parse(json['validFrom']),
      validUntil: DateTime.parse(json['validUntil']),
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'description': description,
      'discountPercentage': discountPercentage,
      'discountAmount': discountAmount,
      'minimumOrderAmount': minimumOrderAmount,
      'maxUsage': maxUsage,
      'usedCount': usedCount,
      'validFrom': validFrom.toIso8601String(),
      'validUntil': validUntil.toIso8601String(),
      'isActive': isActive,
    };
  }

  @override
  List<Object?> get props => [
    id, code, description, discountPercentage, discountAmount, minimumOrderAmount, maxUsage, usedCount, validFrom, validUntil, isActive
  ];
}
