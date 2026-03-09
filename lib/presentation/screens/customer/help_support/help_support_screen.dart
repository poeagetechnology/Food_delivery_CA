import 'package:flutter/material.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help & Support')),
      body: ListView(
        children: [
          ListTile(
            title: Text('FAQ'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Contact Us'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Report an Issue'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
