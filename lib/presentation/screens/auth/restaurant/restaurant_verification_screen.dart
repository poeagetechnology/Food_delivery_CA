import 'package:flutter/material.dart';

class RestaurantVerificationScreen extends StatefulWidget {
  const RestaurantVerificationScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantVerificationScreen> createState() => _RestaurantVerificationScreenState();
}

class _RestaurantVerificationScreenState extends State<RestaurantVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Restaurant Verification')),
      body: Center(
        child: Text('Verification Form'),
      ),
    );
  }
}
