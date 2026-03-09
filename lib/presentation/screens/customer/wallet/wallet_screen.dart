import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wallet')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('Wallet Balance'),
                    Text('₹0.00', style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(child: Text('Transactions')),
          ),
        ],
      ),
    );
  }
}
