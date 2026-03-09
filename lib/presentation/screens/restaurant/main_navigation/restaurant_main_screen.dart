import 'package:flutter/material.dart';

class RestaurantMainScreen extends StatefulWidget {
  const RestaurantMainScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantMainScreen> createState() => _RestaurantMainScreenState();
}

class _RestaurantMainScreenState extends State<RestaurantMainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: _getScreen(_selectedIndex),
    );
  }

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text('Restaurant Home'));
      case 1:
        return const Center(child: Text('Orders'));
      case 2:
        return const Center(child: Text('Menu Management'));
      case 3:
        return const Center(child: Text('Analytics'));
      case 4:
        return const Center(child: Text('Profile'));
      default:
        return const Center(child: Text('Home'));
    }
  }
}
