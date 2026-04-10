import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../restaurant_detail/restaurant_detail_screen.dart';
import '../search/search_screen.dart';
import 'food_detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();


}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {

  int _currentIndex = 0;
  bool showFoods = true;

  /// FOOD SLIDER IMAGES
  final List<String> banners = [
    "assets/images/ice.jpg",
    "assets/images/beverage.jpg",
    "assets/images/tandoori.png",
    "assets/images/piz.png",
    "assets/images/chicken.jpg",
    "assets/images/brownie.png"
  ];

  Future<List<Map<String, dynamic>>> fetchFoods() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('popular foods') // 👈 space name as you said
        .get();

    return snapshot.docs.map((doc) {
      return {
        "name": doc['name'],
        "image": doc['image'],
        "price": doc['price'],
        "rating": doc['rating'],
        "description": doc['description'],
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _homeContent(),
      SearchScreen(
        goToHome: () {
          setState(() {
            _currentIndex = 0;
          });
        },
      ),
      const Center(child: Text("Cart Screen")),
      const Center(child: Text("Orders Screen")),
      const Center(child: Text("Profile Screen")),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),

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
          const Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.jpg"),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return "Discover Food";
      case 1:
        return "Search";
      case 2:
        return "Cart";
      case 3:
        return "Orders";
      case 4:
        return "Profile";
      default:
        return "";
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

          /// TOGGLE BUTTONS
          Row(
            children: [

              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showFoods = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: showFoods ? Colors.orange : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        "Foods",
                        style: GoogleFonts.poppins(
                          color: showFoods ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showFoods = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: !showFoods ? Colors.orange : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        "Restaurants",
                        style: GoogleFonts.poppins(
                          color: !showFoods ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          showFoods ? _foodsSection() : _restaurantsSection(),
        ],
      ),
    );
  }

  Widget _foodsSection() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchFoods(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Error loading foods"));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No foods found"));
        }

        final foods = snapshot.data!;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: foods.length, // ✅ changed
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final food = foods[index]; // ✅ changed

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodDetailScreen(
                      name: food["name"],
                      price: "₹${food["price"]}",
                      rating: food["rating"].toString(),
                      image: food["image"],
                      description: food["description"] ?? "No description",
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

                    /// 🔥 IMPORTANT CHANGE (asset → network)
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20)),
                      child: Image.network(
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

                          Text(
                            food["name"],
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600),
                          ),

                          Text(
                            "₹${food["price"]}",
                            style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),

                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 16),
                              Text(food["rating"].toString()),
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
        );
      },
    );
  }

  /// 🔥 FETCH RESTAURANTS FROM FIREBASE
  Future<List<Map<String, dynamic>>> fetchRestaurants() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('restaurants')
        .get();

    return snapshot.docs.map((doc) {
      return {
        "id": doc.id,
        "name": doc['name'],
        "image": doc['image'],
        "rating": doc['rating'],
        "deliveryTime": doc['deliveryTime'],
      };
    }).toList();
  }

  /// RESTAURANT GRID
  Widget _restaurantsSection() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchRestaurants(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Error loading restaurants"));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No restaurants found"));
        }


        final restaurants = snapshot.data!;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: restaurants.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final restaurant = restaurants[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        RestaurantDetailScreen(
                          restaurantName: restaurant["name"],
                          restaurantImage: restaurant["image"],
                          restaurantId: restaurant["id"], // 👈 important
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
                  children: [

                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),


                    child: Image.network(
                      restaurant["image"],
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

                          Text(
                            restaurant["name"],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.orange, size: 16),
                              Text(restaurant["rating"].toString(),
                                style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),),


                            ],
                          ),

                          const SizedBox(height: 5),

                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 16,
                                color: Colors.orange,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                restaurant["deliveryTime"],
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
