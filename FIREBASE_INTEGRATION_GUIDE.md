# Firebase Integration Complete Guide

## Setup Instructions

### 1. **Generate Firebase Configuration Files**

#### Use FlutterFire CLI (RECOMMENDED):
```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase for your project
flutterfire configure
```

This automatically:
- Connects to your Firebase Console project
- Generates `firebase_options.dart` 
- Updates Android & iOS configuration files
- Updates `pubspec.yaml` dependencies

#### Manual Setup (If FlutterFire CLI fails):

**Android Setup:**
1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create new project or select existing
3. Add Android app with package name: `com.example.customer_mobile_app`
4. Download `google-services.json`
5. Place in `android/app/google-services.json`

**iOS Setup:**
1. Add iOS app in Firebase Console
2. Download `GoogleService-Info.plist`
3. In Xcode: Right-click `Runner` folder → Add Files
4. Select `GoogleService-Info.plist` → Add to target

### 2. **Project Structure**
```
lib/
├── main.dart (Firebase initialization)
├── firebase_options.dart (Platform configs)
├── services/
│   ├── firebase_auth_service.dart (Authentication)
│   └── firestore_service.dart (Database operations)
├── screens/
│   ├── auth/
│   │   ├── login/login_screen.dart (UPDATED with Firebase)
│   │   └── role_selection/role_selection_screen.dart
│   └── dashboards/
│       ├── customer_dashboard.dart
│       └── restaurant_dashboard.dart
```

## Firebase Services Overview

### **Authentication Service** (`firebase_auth_service.dart`)

**Key Methods:**

```dart
// Sign up new user
FirebaseAuthService.signUp(
  email: 'user@example.com',
  password: 'password123',
  name: 'John Doe',
  role: 'customer', // or 'restaurant'
);

// Login
FirebaseAuthService.login(
  email: 'user@example.com',
  password: 'password123',
);

// Logout
FirebaseAuthService.logout();

// Get current user
User? currentUser = FirebaseAuthService.currentUser;

// Get user profile from Firestore
Map<String, dynamic>? profile = await FirebaseAuthService.getUserProfile(uid);

// Update profile
await FirebaseAuthService.updateUserProfile(
  uid: userId,
  data: {'phone': '+1234567890', 'address': '123 Main St'},
);
```

### **Firestore Service** (`firestore_service.dart`)

**Restaurant Operations:**
```dart
// Add new restaurant
await FirestoreService.addRestaurant(
  ownerId: userId,
  restaurantData: {
    'name': 'The Burger Junction',
    'cuisine': 'American',
    'phone': '+1234567890',
    'address': '123 Main St',
    'description': 'Best burgers in town',
    'deliveryTime': 30,
    'minimumOrder': 15.00,
  },
);

// Get all restaurants
List<Map<String, dynamic>> restaurants = await FirestoreService.getAllRestaurants();

// Get restaurant details
Map<String, dynamic>? restaurant = await FirestoreService.getRestaurant(restaurantId);
```

**Order Operations:**
```dart
// Create order
await FirestoreService.createOrder(
  customerId: userId,
  restaurantId: restaurantId,
  items: [
    {'name': 'Burger', 'quantity': 2, 'price': 12.99},
    {'name': 'Fries', 'quantity': 1, 'price': 5.99},
  ],
  totalAmount: 31.97,
  deliveryAddress: '456 Oak Ave',
);

// Get customer's orders
List<Map<String, dynamic>> orders = await FirestoreService.getCustomerOrders(userId);

// Get restaurant's pending orders (real-time)
Stream<List<Map<String, dynamic>>> ordersStream = 
  FirestoreService.streamRestaurantOrders(restaurantId);

// Update order status
await FirestoreService.updateOrderStatus(orderId, 'preparing');
```

**Menu Operations:**
```dart
// Add menu item
await FirestoreService.addMenuItem(
  restaurantId: restaurantId,
  itemData: {
    'name': 'Cheeseburger',
    'description': 'Delicious cheese burger',
    'price': 12.99,
    'category': 'Burgers',
    'image': 'url_to_image',
    'available': true,
  },
);

// Get menu items
List<Map<String, dynamic>> menuItems = await FirestoreService.getMenuItems(restaurantId);
```

**Reviews & Ratings:**
```dart
// Add review
await FirestoreService.addReview(
  restaurantId: restaurantId,
  customerId: userId,
  rating: 4.5,
  comment: 'Great food and fast delivery!',
);

// Get reviews
List<Map<String, dynamic>> reviews = await FirestoreService.getRestaurantReviews(restaurantId);
```

## Firestore Database Structure

```
users/
  {uid}/
    - uid: string
    - email: string
    - name: string
    - role: 'customer' | 'restaurant'
    - createdAt: timestamp
    - profilePicture: string (URL)
    - phone: string
    - address: string

restaurants/
  {restaurantId}/
    - ownerId: string (user UID)
    - name: string
    - cuisine: string
    - phone: string
    - address: string
    - description: string
    - deliveryTime: number (minutes)
    - minimumOrder: number
    - rating: number
    - totalOrders: number
    - isActive: boolean
    - createdAt: timestamp
    
    menu_items/
      {itemId}/
        - name: string
        - description: string
        - price: number
        - category: string
        - image: string (URL)
        - available: boolean
        - createdAt: timestamp
    
    reviews/
      {reviewId}/
        - customerId: string
        - rating: number
        - comment: string
        - createdAt: timestamp

orders/
  {orderId}/
    - customerId: string
    - restaurantId: string
    - items: array
    - totalAmount: number
    - deliveryAddress: string
    - status: 'pending' | 'confirmed' | 'preparing' | 'ready' | 'delivered'
    - createdAt: timestamp
    - updatedAt: timestamp
    - orderNumber: string
```

## Firebase Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Users collection
    match /users/{userId} {
      allow read, write: if request.auth.uid == userId;
    }
    
    // Restaurants collection
    match /restaurants/{restaurantId} {
      allow read: if true; // Anyone can view restaurants
      allow create: if request.auth != null;
      allow update: if request.auth.uid == resource.data.ownerId;
      allow delete: if request.auth.uid == resource.data.ownerId;
      
      // Menu items
      match /menu_items/{itemId} {
        allow read: if true;
        allow create, update, delete: if request.auth.uid == get(/databases/$(database)/documents/restaurants/$(restaurantId)).data.ownerId;
      }
      
      // Reviews
      match /reviews/{reviewId} {
        allow read: if true;
        allow create: if request.auth != null;
        allow update, delete: if request.auth.uid == resource.data.customerId;
      }
    }
    
    // Orders collection
    match /orders/{orderId} {
      allow read: if request.auth.uid == resource.data.customerId || 
                     request.auth.uid == get(/databases/$(database)/documents/restaurants/$(resource.data.restaurantId)).data.ownerId;
      allow create: if request.auth != null;
      allow update: if request.auth.uid == resource.data.customerId || 
                       request.auth.uid == get(/databases/$(database)/documents/restaurants/$(resource.data.restaurantId)).data.ownerId;
    }
  }
}
```

## Integration with UI Screens

### Example: Updating Login Screen

Replace the mock authentication in `login_screen.dart` with:

```dart
import 'package:customer_mobile_app/services/firebase_auth_service.dart';

void _handleLogin() async {
  if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
    _showSnackBar('Please fill all fields');
    return;
  }

  if (!_isValidEmail(_emailController.text)) {
    _showSnackBar('Please enter a valid email');
    return;
  }

  setState(() => _isLoading = true);

  final result = await FirebaseAuthService.login(
    email: _emailController.text,
    password: _passwordController.text,
  );

  if (!mounted) return;
  setState(() => _isLoading = false);

  if (result['success']) {
    String userRole = result['role'] ?? 'customer';
    
    if (userRole == 'customer') {
      Navigator.pushReplacementNamed(context, '/customer_dashboard');
    } else if (userRole == 'restaurant') {
      Navigator.pushReplacementNamed(context, '/restaurant_dashboard');
    }
  } else {
    _showSnackBar(result['message'] ?? 'Login failed');
  }
}
```

## Testing with Sample Data

### Add Sample Restaurants (Run Once):

```dart
// In a debug screen or init function
Future<void> addSampleData() async {
  // Add sample restaurants
  await FirestoreService.addRestaurant(
    ownerId: 'demo_restaurant_owner_1',
    restaurantData: {
      'name': 'The Burger Junction',
      'cuisine': 'American',
      'phone': '+1-555-0101',
      'address': '123 Main St, City',
      'description': 'Best burgers in town',
      'deliveryTime': 25,
      'minimumOrder': 15.00,
    },
  );
}
```

## Common Issues & Solutions

| Issue | Solution |
|-------|----------|
| `MissingPluginException` | Run `flutter pub get` and `flutter pub upgrade` |
| Can't find `firebase_options.dart` | Run `flutterfire configure` |
| Android build fails | Ensure `google-services.json` is in correct location |
| iOS build fails | Ensure `GoogleService-Info.plist` is added to Xcode |
| Authentication fails | Check Firestore security rules |
| Slow queries | Add composite indexes via Firebase Console |

## Next Steps

1. ✅ Install packages (Already done)
2. ✅ Create service files (Already done)
3. 👉 Run `flutterfire configure` to generate platform configs
4. Update all screens to use Firebase services instead of mock data
5. Add image storage with Firebase Storage
6. Implement push notifications
7. Add offline support with local caching
