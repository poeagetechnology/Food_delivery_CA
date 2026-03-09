// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
// Later change to CustomerMainScreen

class CustomerOtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String generatedOtp;

  const CustomerOtpScreen({
    super.key,
    required this.phoneNumber,
    required this.generatedOtp,
  });

  @override
  State<CustomerOtpScreen> createState() => _CustomerOtpScreenState();
}

class _CustomerOtpScreenState extends State<CustomerOtpScreen> {

  final TextEditingController otpController = TextEditingController();
  bool isLoading = false;

  void verifyOtp() async {
    if (otpController.text.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter 6 digit OTP")),
      );
      return;
    }

    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => isLoading = false);

    if (otpController.text == widget.generatedOtp) {
    
     } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OTP Verification")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "OTP sent to ${widget.phoneNumber}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "For testing use OTP: 123456",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "Enter 6 digit OTP",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isLoading ? null : verifyOtp,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Verify OTP"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}