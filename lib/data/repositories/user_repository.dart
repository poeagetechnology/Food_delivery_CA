import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Exception, Map<String, dynamic>>> getUserProfile(String userId);
  Future<Either<Exception, Map<String, dynamic>>> updateUserProfile(String userId, Map<String, dynamic> data);
  Future<Either<Exception, List<Map<String, dynamic>>>> getUserAddresses(String userId);
  Future<Either<Exception, Map<String, dynamic>>> addUserAddress(String userId, Map<String, dynamic> data);
}

class UserRepositoryImpl implements UserRepository {
  // TODO: Implement with datasources

  @override
  Future<Either<Exception, Map<String, dynamic>>> addUserAddress(String userId, Map<String, dynamic> data) async {
    return Right({});
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> getUserProfile(String userId) async {
    return Right({});
  }

  @override
  Future<Either<Exception, List<Map<String, dynamic>>>> getUserAddresses(String userId) async {
    return Right([]);
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> updateUserProfile(String userId, Map<String, dynamic> data) async {
    return Right({});
  }
}
