import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Restaurant Details')),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.grey[300],
            child: Center(child: Text('Restaurant Image')),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Restaurant Name', style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(height: 8),
                Text('Cuisine Type'),
              ],
            ),
          ),
          Expanded(
            child: Center(child: Text('Menu Items')),
          ),
        ],
      ),
    );
  }
}
