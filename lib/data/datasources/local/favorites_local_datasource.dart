abstract class FavoritesLocalDataSource {
  Future<void> saveFavorite(String restaurantId);
  Future<void> removeFavorite(String restaurantId);
  Future<List<String>> getFavorites();
  Future<bool> isFavorited(String restaurantId);
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  // TODO: Implement local storage

  @override
  Future<void> saveFavorite(String restaurantId) async {}

  @override
  Future<void> removeFavorite(String restaurantId) async {}

  @override
  Future<List<String>> getFavorites() async => [];

  @override
  Future<bool> isFavorited(String restaurantId) async => false;
}
