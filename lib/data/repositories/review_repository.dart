import 'package:dartz/dartz.dart';

abstract class ReviewRepository {
  Future<Either<Exception, Map<String, dynamic>>> writeReview(Map<String, dynamic> data);
  Future<Either<Exception, List<Map<String, dynamic>>>> getReviews(String restaurantId);
}

class ReviewRepositoryImpl implements ReviewRepository {
  // TODO: Implement with datasources

  @override
  Future<Either<Exception, List<Map<String, dynamic>>>> getReviews(String restaurantId) async {
    return Right([]);
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> writeReview(Map<String, dynamic> data) async {
    return Right({});
  }
}
