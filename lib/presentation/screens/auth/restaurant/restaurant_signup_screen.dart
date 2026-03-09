import 'package:flutter/material.dart';

class RestaurantSignupScreen extends StatefulWidget {
  const RestaurantSignupScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantSignupScreen> createState() => _RestaurantSignupScreenState();
}

class _RestaurantSignupScreenState extends State<RestaurantSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Restaurant Signup')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text('Restaurant Signup Form'),
        ),
      ),
    );
  }
}
