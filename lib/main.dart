import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:customer_mobile_app/screens/splash/splash_screen.dart';
import 'package:customer_mobile_app/screens/auth/role_selection/role_selection_screen.dart';
import 'package:customer_mobile_app/screens/dashboards/customer_dashboard.dart';
import 'package:customer_mobile_app/screens/dashboards/restaurant_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/role_selection': (context) => const RoleSelectionScreen(),
        '/customer_dashboard': (context) => const CustomerDashboard(),
        '/restaurant_dashboard': (context) => const RestaurantDashboard(),
      },
    );
  }
}
