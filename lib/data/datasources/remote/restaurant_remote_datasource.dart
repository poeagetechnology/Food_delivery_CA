abstract class RestaurantRemoteDataSource {
  Future<List<Map<String, dynamic>>> getRestaurants();
  Future<List<Map<String, dynamic>>> searchRestaurants(String query);
  Future<Map<String, dynamic>> getRestaurantDetail(String restaurantId);
  Future<Map<String, dynamic>> addRestaurant(Map<String, dynamic> data);
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  // TODO: Implement HTTP client

  @override
  Future<List<Map<String, dynamic>>> getRestaurants() async {
    return [];
  }

  @override
  Future<List<Map<String, dynamic>>> searchRestaurants(String query) async {
    return [];
  }

  @override
  Future<Map<String, dynamic>> getRestaurantDetail(String restaurantId) async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> addRestaurant(Map<String, dynamic> data) async {
    return {};
  }
}
