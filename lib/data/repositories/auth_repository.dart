import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Exception, Map<String, dynamic>>> customerSignup(Map<String, dynamic> data);
  Future<Either<Exception, Map<String, dynamic>>> restaurantSignup(Map<String, dynamic> data);
  Future<Either<Exception, Map<String, dynamic>>> login(String email, String password);
  Future<Either<Exception, Map<String, dynamic>>> verifyOtp(String email, String otp);
  Future<Either<Exception, Map<String, dynamic>>> resetPassword(String email);
}

class AuthRepositoryImpl implements AuthRepository {
  // TODO: Implement with datasources

  @override
  Future<Either<Exception, Map<String, dynamic>>> customerSignup(Map<String, dynamic> data) async {
    return Right({});
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> login(String email, String password) async {
    return Right({});
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> resetPassword(String email) async {
    return Right({});
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> restaurantSignup(Map<String, dynamic> data) async {
    return Right({});
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> verifyOtp(String email, String otp) async {
    return Right({});
  }
}
