abstract class UserRemoteDataSource {
  Future<Map<String, dynamic>> getUserProfile(String userId);
  Future<Map<String, dynamic>> updateUserProfile(String userId, Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> getUserAddresses(String userId);
  Future<Map<String, dynamic>> addUserAddress(String userId, Map<String, dynamic> data);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  // TODO: Implement HTTP client

  @override
  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> updateUserProfile(String userId, Map<String, dynamic> data) async {
    return {};
  }

  @override
  Future<List<Map<String, dynamic>>> getUserAddresses(String userId) async {
    return [];
  }

  @override
  Future<Map<String, dynamic>> addUserAddress(String userId, Map<String, dynamic> data) async {
    return {};
  }
}
