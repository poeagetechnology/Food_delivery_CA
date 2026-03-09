import 'package:flutter/material.dart';

class RestaurantLoginScreen extends StatefulWidget {
  const RestaurantLoginScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantLoginScreen> createState() => _RestaurantLoginScreenState();
}

class _RestaurantLoginScreenState extends State<RestaurantLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Restaurant Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text('Restaurant Login Form'),
        ),
      ),
    );
  }
}
