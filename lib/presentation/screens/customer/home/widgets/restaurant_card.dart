import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: 150,
              color: Colors.grey[300],
              child: Center(child: Text('Restaurant Image')),
            ),
            SizedBox(height: 8),
            Text('Restaurant Name'),
            Text('Cuisine Type'),
          ],
        ),
      ),
    );
  }
}
