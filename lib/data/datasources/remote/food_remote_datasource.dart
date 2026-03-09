abstract class FoodRemoteDataSource {
  Future<List<Map<String, dynamic>>> getFoodItems(String restaurantId);
  Future<Map<String, dynamic>> getFoodDetail(String foodId);
  Future<List<Map<String, dynamic>>> searchFoods(String query);
}

class FoodRemoteDataSourceImpl implements FoodRemoteDataSource {
  // TODO: Implement HTTP client

  @override
  Future<List<Map<String, dynamic>>> getFoodItems(String restaurantId) async {
    return [];
  }

  @override
  Future<Map<String, dynamic>> getFoodDetail(String foodId) async {
    return {};
  }

  @override
  Future<List<Map<String, dynamic>>> searchFoods(String query) async {
    return [];
  }
}
