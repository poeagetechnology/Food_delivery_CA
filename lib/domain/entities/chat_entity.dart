import 'package:equatable/equatable.dart';

class ChatEntity extends Equatable {
  final String id;
  final String senderId;
  final String recipientId;
  final String message;
  final DateTime timestamp;

  const ChatEntity({
    required this.id,
    required this.senderId,
    required this.recipientId,
    required this.message,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [id, senderId, recipientId, message, timestamp];
}
