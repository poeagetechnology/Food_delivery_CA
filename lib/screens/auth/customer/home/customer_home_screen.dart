import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'food_detail_screen.dart';
import '../search/search_screen.dart';
class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {

  int _currentIndex = 0;

  /// FOOD SLIDER IMAGES
  final List<String> banners = [
    "assets/images/ice.jpg",
    "assets/images/beverage.jpg",
    "assets/images/tandoori.png",
    "assets/images/piz.png",
    "assets/images/chicken.jpg",
    "assets/images/brownie.png"
  ];

  /// POPULAR FOODS
  final List<Map<String, dynamic>> popularFoods = [
    {
      "name": "Chicken Biryani",
      "price": "₹ 120",
      "rating": "4.8",
      "image": "assets/images/biryanii.png"
    },
    {
      "name": "Authentic Meals",
      "price": "₹ 200",
      "rating": "4.5",
      "image": "assets/images/meals.jpg"
    },
    {
      "name": "Cakes",
      "price": "₹ 250",
      "rating": "4.7",
      "image": "assets/images/cakess.png"
    },
    {
      "name": "Shakes",
      "price": "₹ 100",
      "rating": "4.6",
      "image": "assets/images/cold.jpg"
    },
  ];

  /// RESTAURANTS
  final List<Map<String, String>> restaurants = [
    {"name": "Spicy Hub", "image": "assets/images/spicy.jpg"},
    {"name": "Food Palace", "image": "assets/images/foodpalace.png"},
    {"name": "Taste Town", "image": "assets/images/taste.jpg"},
    {"name": "Taste buds", "image": "assets/images/chick.png"},
    {"name": "Chatty Chats", "image": "assets/images/pani.png"},
    {"name": "Frieddis", "image": "assets/images/fried.jpg"},
  ];

  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [
      _homeContent(),
      const SearchScreen(),
      const Center(child: Text("Cart Screen")),
      const Center(child: Text("Orders Screen")),
      const Center(child: Text("Profile Screen")),
    ];
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          _getTitle(_currentIndex),
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: _currentIndex == 0
            ? [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage:
              const AssetImage("assets/images/profile.jpg"),
            ),
          )
        ]
            : [],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.orange,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: "Orders"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0: return "Discover Food";
      case 1: return "Search";
      case 2: return "Cart";
      case 3: return "Orders";
      case 4: return "Profile";
      default: return "";
    }
  }

  /// ================= HOME CONTENT =================
  Widget _homeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// SEARCH BAR
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search food...",
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),


          /// FOOD SLIDER
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: banners.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 90,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(banners[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 25),

          /// POPULAR FOODS
          Text(
            "Popular Foods",
            style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: popularFoods.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {

              final food = popularFoods[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetailScreen(
                        name: food["name"],
                        price: food["price"],
                        rating: food["rating"],
                        image: food["image"],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                        child: Image.asset(
                          food["image"],
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(food["name"],
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                            Text(food["price"],
                                style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),

                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.orange, size: 16),
                                Text(food["rating"]),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 25),

          /// NEARBY RESTAURANTS
          Text(
            "Nearby Restaurants",
            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),

          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];

                return GestureDetector(
                  onTap: () {
                    // Navigate to Restaurant menu screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantFoodScreen(
                          restaurantName: restaurant["name"]!,
                          restaurantImage: restaurant["image"]!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(restaurant["image"]!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        restaurant["name"]!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= NEW SCREEN FOR RESTAURANT MENU =================
class RestaurantFoodScreen extends StatelessWidget {
  final String restaurantName;
  final String restaurantImage;

  const RestaurantFoodScreen({
    super.key,
    required this.restaurantName,
    required this.restaurantImage,
  });

  @override
  Widget build(BuildContext context) {
    // Sample foods for the restaurant
    final foods = [
      {"name": "Special Meal", "price": "₹150", "image": "assets/images/meals.jpg"},
      {"name": "Cold Drink", "price": "₹50", "image": "assets/images/cold.jpg"},
      {"name": "Dessert", "price": "₹80", "image": "assets/images/cakess.png"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantName),
      ),
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];
          return ListTile(
            leading: Image.asset(food["image"]!, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(food["name"]!),
            subtitle: Text(food["price"]!),
            trailing: ElevatedButton(
              onPressed: () {
                // Add to Cart logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${food["name"]} added to cart!")),
                );
              },
              child: const Text("Add"),
            ),
          );
        },
      ),
    );
  }
}