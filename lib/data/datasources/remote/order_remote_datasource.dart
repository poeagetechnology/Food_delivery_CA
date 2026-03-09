abstract class OrderRemoteDataSource {
  Future<Map<String, dynamic>> placeOrder(Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> getOrders(String userId);
  Future<Map<String, dynamic>> getOrderDetail(String orderId);
  Future<Map<String, dynamic>> cancelOrder(String orderId);
  Future<Map<String, dynamic>> trackOrder(String orderId);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  // TODO: Implement HTTP client

  @override
  Future<Map<String, dynamic>> placeOrder(Map<String, dynamic> data) async {
    return {};
  }

  @override
  Future<List<Map<String, dynamic>>> getOrders(String userId) async {
    return [];
  }

  @override
  Future<Map<String, dynamic>> getOrderDetail(String orderId) async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> cancelOrder(String orderId) async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> trackOrder(String orderId) async {
    return {};
  }
}
