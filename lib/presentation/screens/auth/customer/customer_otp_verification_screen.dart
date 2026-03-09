import 'package:flutter/material.dart';

class CustomerOtpVerificationScreen extends StatefulWidget {
  const CustomerOtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<CustomerOtpVerificationScreen> createState() => _CustomerOtpVerificationScreenState();
}

class _CustomerOtpVerificationScreenState extends State<CustomerOtpVerificationScreen> {
  late TextEditingController otpController;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify OTP')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter the OTP sent to your email'),
            SizedBox(height: 24),
            TextFormField(
              controller: otpController,
              decoration: InputDecoration(labelText: 'OTP'),
              maxLength: 6,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              child: Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
