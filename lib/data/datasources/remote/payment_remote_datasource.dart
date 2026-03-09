abstract class PaymentRemoteDataSource {
  Future<Map<String, dynamic>> initiatePayment(Map<String, dynamic> data);
  Future<Map<String, dynamic>> verifyPayment(String paymentId, String signature);
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  // TODO: Implement HTTP client

  @override
  Future<Map<String, dynamic>> initiatePayment(Map<String, dynamic> data) async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> verifyPayment(String paymentId, String signature) async {
    return {};
  }
}
