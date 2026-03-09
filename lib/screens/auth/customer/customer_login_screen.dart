// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'customer_otp_screen.dart';
import 'home/customer_home_screen.dart'; // Temporary (later change to CustomerMainScreen)

class CustomerLoginScreen extends StatefulWidget {
  const CustomerLoginScreen({super.key});

  @override
  State<CustomerLoginScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void sendOtp() async {
    if (phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter phone number")),
      );
      return;
    }

    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => isLoading = false);

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CustomerOtpScreen(
          phoneNumber: phoneController.text,
          generatedOtp: "123456",
        ),
      ),
    );

    if (result == true) {
      _tabController.animateTo(1); // Switch to Email tab
    }
  }



  void loginWithEmail() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter email and password")),
      );
      return;
    }

    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => isLoading = false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const CustomerHomeScreen(), // Change later
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Login"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Phone"),
            Tab(text: "Email"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TabBarView(
          controller: _tabController,
          children: [

            // ---------------- PHONE TAB ----------------
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Enter phone number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.phone),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : sendOtp,
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Send OTP"),
                  ),
                ),
              ],
            ),

            // ---------------- EMAIL TAB ----------------
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : loginWithEmail,
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Login"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}