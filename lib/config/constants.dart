/// App Constants
/// Contains all constant values used across the application

class AppConstants {
  // API Endpoints
  static const String baseUrl = 'https://api.example.com';
  static const String authEndpoint = '/auth';
  static const String restaurantEndpoint = '/restaurants';
  static const String orderEndpoint = '/orders';
  static const String userEndpoint = '/users';

  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration connectionTimeout = Duration(seconds: 15);

  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  static const String isLoggedInKey = 'is_logged_in';
  static const String userRoleKey = 'user_role';

  // Pagination
  static const int pageSize = 20;

  // Payment
  static const double minimumOrderAmount = 50.0;
  static const double deliveryCharge = 20.0;
}
