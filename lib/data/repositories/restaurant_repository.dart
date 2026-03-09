import 'package:dartz/dartz.dart';

abstract class RestaurantRepository {
  Future<Either<Exception, List<Map<String, dynamic>>>> getRestaurants();
  Future<Either<Exception, List<Map<String, dynamic>>>> searchRestaurants(String query);
  Future<Either<Exception, Map<String, dynamic>>> getRestaurantDetail(String restaurantId);
  Future<Either<Exception, Map<String, dynamic>>> addRestaurant(Map<String, dynamic> data);
}

class RestaurantRepositoryImpl implements RestaurantRepository {
  // TODO: Implement with datasources

  @override
  Future<Either<Exception, Map<String, dynamic>>> addRestaurant(Map<String, dynamic> data) async {
    return Right({});
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> getRestaurantDetail(String restaurantId) async {
    return Right({});
  }

  @override
  Future<Either<Exception, List<Map<String, dynamic>>>> getRestaurants() async {
    return Right([]);
  }

  @override
  Future<Either<Exception, List<Map<String, dynamic>>>> searchRestaurants(String query) async {
    return Right([]);
  }
}
