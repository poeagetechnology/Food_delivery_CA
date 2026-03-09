import 'package:dartz/dartz.dart';

abstract class PaymentRepository {
  Future<Either<Exception, Map<String, dynamic>>> initiatePayment(Map<String, dynamic> data);
  Future<Either<Exception, Map<String, dynamic>>> verifyPayment(String paymentId, String signature);
}

class PaymentRepositoryImpl implements PaymentRepository {
  // TODO: Implement with datasources

  @override
  Future<Either<Exception, Map<String, dynamic>>> initiatePayment(Map<String, dynamic> data) async {
    return Right({});
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> verifyPayment(String paymentId, String signature) async {
    return Right({});
  }
}
