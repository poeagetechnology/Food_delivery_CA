import 'package:flutter/material.dart';

class CustomerForgotPasswordScreen extends StatefulWidget {
  const CustomerForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CustomerForgotPasswordScreen> createState() => _CustomerForgotPasswordScreenState();
}

class _CustomerForgotPasswordScreenState extends State<CustomerForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text('Reset Password Form'),
        ),
      ),
    );
  }
}
