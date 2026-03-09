/// Named Routes Configuration
/// All route names and paths used in the application

class AppRoutes {
  static const String splash = '/splash';
  static const String roleSelection = '/role-selection';
  
  // Customer Auth Routes
  static const String customerLogin = '/customer-login';
  static const String customerSignup = '/customer-signup';
  static const String customerOtpVerification = '/customer-otp';
  static const String customerForgotPassword = '/customer-forgot-password';
  
  // Restaurant Auth Routes
  static const String restaurantLogin = '/restaurant-login';
  static const String restaurantSignup = '/restaurant-signup';
  static const String restaurantVerification = '/restaurant-verification';
  static const String restaurantDocumentUpload = '/restaurant-document-upload';
  
  // Customer Screens Routes
  static const String customerHome = '/customer-home';
  static const String customerSearch = '/customer-search';
  static const String restaurantDetail = '/restaurant-detail';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String orders = '/orders';
  static const String orderDetail = '/order-detail';
  static const String orderTracking = '/order-tracking';
  static const String favorites = '/favorites';
  static const String wallet = '/wallet';
  static const String addresses = '/addresses';
  static const String notifications = '/notifications';
  static const String helpSupport = '/help-support';
  static const String profile = '/profile';
  
  // Restaurant Screens Routes
  static const String restaurantHome = '/restaurant-home';
  static const String restaurantOrders = '/restaurant-orders';
  static const String menuManagement = '/menu-management';
  static const String inventory = '/inventory';
  static const String analytics = '/analytics';
  static const String deliveryPartners = '/delivery-partners';
  static const String restaurantProfile = '/restaurant-profile';
  
  // Common Routes
  static const String settings = '/settings';
  static const String about = '/about';
  static const String privacyPolicy = '/privacy-policy';
  static const String termsConditions = '/terms-conditions';
}
