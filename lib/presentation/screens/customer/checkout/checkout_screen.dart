import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text('Delivery Address'),
              SizedBox(height: 16),
              Text('Payment Method'),
              SizedBox(height: 16),
              Text('Order Summary'),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                child: Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
