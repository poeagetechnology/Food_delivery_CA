abstract class UserLocalDataSource {
  Future<void> saveUserProfile(Map<String, dynamic> profile);
  Future<Map<String, dynamic>?> getUserProfile();
  Future<void> clearUserProfile();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  // TODO: Implement local storage

  @override
  Future<void> saveUserProfile(Map<String, dynamic> profile) async {}

  @override
  Future<Map<String, dynamic>?> getUserProfile() async => null;

  @override
  Future<void> clearUserProfile() async {}
}
