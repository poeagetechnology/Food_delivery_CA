import 'package:dartz/dartz.dart';

abstract class FoodRepository {
  Future<Either<Exception, List<Map<String, dynamic>>>> getFoodItems(String restaurantId);
  Future<Either<Exception, Map<String, dynamic>>> getFoodDetail(String foodId);
  Future<Either<Exception, List<Map<String, dynamic>>>> searchFoods(String query);
}

class FoodRepositoryImpl implements FoodRepository {
  // TODO: Implement with datasources

  @override
  Future<Either<Exception, Map<String, dynamic>>> getFoodDetail(String foodId) async {
    return Right({});
  }

  @override
  Future<Either<Exception, List<Map<String, dynamic>>>> getFoodItems(String restaurantId) async {
    return Right([]);
  }

  @override
  Future<Either<Exception, List<Map<String, dynamic>>>> searchFoods(String query) async {
    return Right([]);
  }
}
