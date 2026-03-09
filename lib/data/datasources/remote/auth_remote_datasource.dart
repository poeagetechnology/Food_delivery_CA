/// Remote Data Sources - Interfaces/Contracts
/// These abstract classes define the contract for remote API calls

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> customerSignup(Map<String, dynamic> data);
  Future<Map<String, dynamic>> restaurantSignup(Map<String, dynamic> data);
  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> verifyOtp(String email, String otp);
  Future<Map<String, dynamic>> resetPassword(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // TODO: Implement HTTP client
  
  @override
  Future<Map<String, dynamic>> customerSignup(Map<String, dynamic> data) async {
    // TODO: Call API endpoint
    return {};
  }

  @override
  Future<Map<String, dynamic>> restaurantSignup(Map<String, dynamic> data) async {
    // TODO: Call API endpoint
    return {};
  }

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    // TODO: Call API endpoint
    return {};
  }

  @override
  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    // TODO: Call API endpoint
    return {};
  }

  @override
  Future<Map<String, dynamic>> resetPassword(String email) async {
    // TODO: Call API endpoint
    return {};
  }
}
