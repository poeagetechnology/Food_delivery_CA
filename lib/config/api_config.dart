/// API Configuration
/// Manages all API endpoints and configurations

class ApiConfig {
  static const String baseUrl = 'https://api.fooddelivery.com';
  
  // Auth Endpoints
  static const String customerSignup = '$baseUrl/auth/customer/signup';
  static const String restaurantSignup = '$baseUrl/auth/restaurant/signup';
  static const String login = '$baseUrl/auth/login';
  static const String verifyOtp = '$baseUrl/auth/verify-otp';
  static const String resetPassword = '$baseUrl/auth/reset-password';
  
  // Restaurant Endpoints
  static const String getRestaurants = '$baseUrl/restaurants';
  static const String searchRestaurants = '$baseUrl/restaurants/search';
  static const String getRestaurantDetail = '$baseUrl/restaurants';
  static const String addRestaurant = '$baseUrl/restaurants';
  
  // Order Endpoints
  static const String placeOrder = '$baseUrl/orders';
  static const String getOrders = '$baseUrl/orders';
  static const String getOrderDetail = '$baseUrl/orders';
  static const String cancelOrder = '$baseUrl/orders';
  static const String trackOrder = '$baseUrl/orders';
  
  // User Endpoints
  static const String getUserProfile = '$baseUrl/users/profile';
  static const String updateUserProfile = '$baseUrl/users/profile';
  static const String getUserAddresses = '$baseUrl/users/addresses';
  static const String addUserAddress = '$baseUrl/users/addresses';
  
  // Payment Endpoints
  static const String makePayment = '$baseUrl/payments';
  
  // Headers
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
