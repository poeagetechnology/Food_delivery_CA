import 'package:dartz/dartz.dart';

abstract class OrderRepository {
  Future<Either<Exception, Map<String, dynamic>>> placeOrder(Map<String, dynamic> data);
  Future<Either<Exception, List<Map<String, dynamic>>>> getOrders(String userId);
  Future<Either<Exception, Map<String, dynamic>>> getOrderDetail(String orderId);
  Future<Either<Exception, Map<String, dynamic>>> cancelOrder(String orderId);
  Future<Either<Exception, Map<String, dynamic>>> trackOrder(String orderId);
}

class OrderRepositoryImpl implements OrderRepository {
  // TODO: Implement with datasources

  @override
  Future<Either<Exception, Map<String, dynamic>>> cancelOrder(String orderId) async {
    return Right({});
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> getOrderDetail(String orderId) async {
    return Right({});
  }

  @override
  Future<Either<Exception, List<Map<String, dynamic>>>> getOrders(String userId) async {
    return Right([]);
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> placeOrder(Map<String, dynamic> data) async {
    return Right({});
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> trackOrder(String orderId) async {
    return Right({});
  }
}
