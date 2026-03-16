import 'package:customer_mobile_app/screens/auth/customer/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash/splash_screen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SearchControllerProvider(),
      child: const MyApp(),
    )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Customer Mobile App',
      home: SplashScreen(),
    );
  }
}