# Firebase Setup Checklist

## 🚀 Quick Start (5-10 minutes)

### Phase 1: Firebase Project Setup
- [ ] Go to [Firebase Console](https://console.firebase.google.com)
- [ ] Create new project (or select existing)
- [ ] Enable Email/Password authentication
- [ ] Create Firestore database in test mode
- [ ] Note your Project ID

### Phase 2: Connect to Flutter Project
- [ ] Install FlutterFire CLI:
  ```bash
  dart pub global activate flutterfire_cli
  ```
- [ ] Run configuration (in your project directory):
  ```bash
  cd d:\customer_mobile_appp
  flutterfire configure
  ```
- [ ] Select your Firebase project when prompted
- [ ] This generates `firebase_options.dart` and updates configs

### Phase 3: Verify Installation
- [ ] Check that `lib/firebase_options.dart` was created
- [ ] Check that `android/app/google-services.json` exists
- [ ] Check that `ios/Runner/GoogleService-Info.plist` exists
- [ ] Run: `flutter pub get`

### Phase 4: Test Firebase
- [ ] Build and run app: `flutter run`
- [ ] If it builds successfully, Firebase is good to go!

## 📝 Files Already Created for You

✅ **Authentication Service** → `lib/services/firebase_auth_service.dart`
- Handles signup, login, logout
- Stores user profiles in Firestore

✅ **Firestore Service** → `lib/services/firestore_service.dart`  
- Restaurant CRUD operations
- Order management
- Menu items management
- Reviews and ratings

✅ **Firebase Options** → `lib/firebase_options.dart`
- Platform-specific Firebase config (UPDATE WITH YOUR KEYS!)

✅ **Updated Main** → `lib/main.dart`
- Firebase initialization on app startup

## 🔧 How to Use in Your Screens

### Example 1: Update Login to Use Firebase

Replace mock login with real Firebase:

```dart
import 'package:customer_mobile_app/services/firebase_auth_service.dart';

void _handleLogin() async {
  setState(() => _isLoading = true);
  
  final result = await FirebaseAuthService.login(
    email: _emailController.text,
    password: _passwordController.text,
  );
  
  setState(() => _isLoading = false);
  
  if (result['success']) {
    String role = result['role'] ?? 'customer';
    Navigator.pushReplacementNamed(
      context, 
      role == 'customer' ? '/customer_dashboard' : '/restaurant_dashboard'
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result['message']))
    );
  }
}
```

### Example 2: Load Restaurants in Customer Dashboard

```dart
import 'package:customer_mobile_app/services/firestore_service.dart';

@override
void initState() {
  super.initState();
  _loadRestaurants();
}

Future<void> _loadRestaurants() async {
  final restaurants = await FirestoreService.getAllRestaurants();
  setState(() {
    _restaurants = restaurants;
  });
}
```

### Example 3: Get Pending Orders for Restaurant Dashboard

```dart
import 'package:customer_mobile_app/services/firestore_service.dart';

// Real-time order updates:
Stream<List<Map<String, dynamic>>> _ordersStream = 
  FirestoreService.streamRestaurantOrders(restaurantId);

// In your UI:
StreamBuilder<List<Map<String, dynamic>>>(
  stream: _ordersStream,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      final orders = snapshot.data!;
      return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return OrderCard(order: order);
        },
      );
    }
    return const CircularProgressIndicator();
  },
)
```

## 🔐 Important: Update Firebase Options

The `firebase_options.dart` file needs YOUR Firebase project credentials.

After running `flutterfire configure`, the file will be auto-populated. But if you need to manually update it:

1. Open [Firebase Console](https://console.firebase.google.com)
2. Go to Project Settings
3. Find your API keys and credentials
4. Copy values to `firebase_options.dart`

## 📚 Full Documentation

See `FIREBASE_INTEGRATION_GUIDE.md` for:
- Complete service API reference
- Firestore database structure
- Security rules setup
- Troubleshooting tips

## ⚠️ Important Notes

1. **Test Mode**: Start with Firestore in "test mode" for development
2. **Security Rules**: Update rules BEFORE publishing (see guide)
3. **Images**: To store images, use Firebase Storage (not included yet)
4. **Push Notifications**: Use Firebase Cloud Messaging (not included yet)

## 🆘 Common Issues

| Problem | Solution |
|---------|----------|
| `MissingPluginException` | Run `flutter pub get` and `flutter clean && flutter pub get` |
| Build fails | Ensure all files are downloaded correctly via flutterfire configure |
| App crashes on startup | Check firebase_options.dart has correct project ID |

## 🎯 Next Action

1. Run: `flutterfire configure`
2. Test that app builds: `flutter run`
3. Create a test user in Firebase Console Authentication
4. Try logging in with that user
5. Check Firestore to see if user data was saved
