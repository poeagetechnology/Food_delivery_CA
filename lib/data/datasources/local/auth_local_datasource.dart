abstract class AuthLocalDataSource {
  Future<void> saveAuthToken(String token);
  Future<String?> getAuthToken();
  Future<void> clearAuthToken();
  Future<void> saveUserData(Map<String, dynamic> userData);
  Future<Map<String, dynamic>?> getUserData();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  // TODO: Implement local storage

  @override
  Future<void> saveAuthToken(String token) async {}

  @override
  Future<String?> getAuthToken() async => null;

  @override
  Future<void> clearAuthToken() async {}

  @override
  Future<void> saveUserData(Map<String, dynamic> userData) async {}

  @override
  Future<Map<String, dynamic>?> getUserData() async => null;
}
