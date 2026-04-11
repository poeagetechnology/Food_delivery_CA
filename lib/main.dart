import 'package:customer_mobile_app/screens/auth/customer/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:customer_mobile_app/screens/auth/customer/cart/cart_controller.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchControllerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartController(), // 🔥 ADD THIS
        ),
      ],
      child: const MyApp(),
    ),
  );

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Customer Mobile App',

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF3E0),
      ),
      home: SplashScreen(),
    );
  }
}

