import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ============= RESTAURANT OPERATIONS =============

  /// Add a new restaurant
  static Future<Map<String, dynamic>> addRestaurant({
    required String ownerId,
    required Map<String, dynamic> restaurantData,
  }) async {
    try {
      DocumentReference docRef =
          await _firestore.collection('restaurants').add({
        ...restaurantData,
        'ownerId': ownerId,
        'createdAt': DateTime.now(),
        'rating': 0.0,
        'totalOrders': 0,
        'isActive': true,
      });

      return {
        'success': true,
        'restaurantId': docRef.id,
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Failed to add restaurant: $e',
      };
    }
  }

  /// Get all restaurants
  static Future<List<Map<String, dynamic>>> getAllRestaurants() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('restaurants')
          .where('isActive', isEqualTo: true)
          .get();

      return snapshot.docs
          .map((doc) => {...doc.data() as Map, 'id': doc.id})
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// Get restaurant by ID
  static Future<Map<String, dynamic>?> getRestaurant(String restaurantId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('restaurants').doc(restaurantId).get();
      if (doc.exists) {
        return {...doc.data() as Map, 'id': doc.id};
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Get restaurants by owner
  static Future<List<Map<String, dynamic>>> getRestaurantsByOwner(
      String ownerId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('restaurants')
          .where('ownerId', isEqualTo: ownerId)
          .get();

      return snapshot.docs
          .map((doc) => {...doc.data() as Map, 'id': doc.id})
          .toList();
    } catch (e) {
      return [];
    }
  }

  // ============= ORDER OPERATIONS =============

  /// Create a new order
  static Future<Map<String, dynamic>> createOrder({
    required String customerId,
    required String restaurantId,
    required List<Map<String, dynamic>> items,
    required double totalAmount,
    required String deliveryAddress,
  }) async {
    try {
      DocumentReference docRef = await _firestore.collection('orders').add({
        'customerId': customerId,
        'restaurantId': restaurantId,
        'items': items,
        'totalAmount': totalAmount,
        'deliveryAddress': deliveryAddress,
        'status': 'pending', // pending, confirmed, preparing, ready, delivered
        'createdAt': DateTime.now(),
        'updatedAt': DateTime.now(),
        'orderNumber': DateTime.now().millisecondsSinceEpoch.toString(),
      });

      return {
        'success': true,
        'orderId': docRef.id,
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Failed to create order: $e',
      };
    }
  }

  /// Get customer orders
  static Future<List<Map<String, dynamic>>> getCustomerOrders(
      String customerId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('orders')
          .where('customerId', isEqualTo: customerId)
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => {...doc.data() as Map, 'id': doc.id})
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// Get restaurant orders (pending/active)
  static Future<List<Map<String, dynamic>>> getRestaurantOrders(
      String restaurantId,
      {String? status}) async {
    try {
      Query query = _firestore
          .collection('orders')
          .where('restaurantId', isEqualTo: restaurantId);

      if (status != null) {
        query = query.where('status', isEqualTo: status);
      }

      QuerySnapshot snapshot =
          await query.orderBy('createdAt', descending: true).get();

      return snapshot.docs
          .map((doc) => {...doc.data() as Map, 'id': doc.id})
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// Update order status
  static Future<bool> updateOrderStatus(
    String orderId,
    String newStatus,
  ) async {
    try {
      await _firestore.collection('orders').doc(orderId).update({
        'status': newStatus,
        'updatedAt': DateTime.now(),
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  // ============= MENU ITEMS OPERATIONS =============

  /// Add menu item
  static Future<Map<String, dynamic>> addMenuItem({
    required String restaurantId,
    required Map<String, dynamic> itemData,
  }) async {
    try {
      DocumentReference docRef = await _firestore
          .collection('restaurants')
          .doc(restaurantId)
          .collection('menu_items')
          .add({
        ...itemData,
        'createdAt': DateTime.now(),
      });

      return {
        'success': true,
        'itemId': docRef.id,
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Failed to add item: $e',
      };
    }
  }

  /// Get menu items for restaurant
  static Future<List<Map<String, dynamic>>> getMenuItems(
      String restaurantId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('restaurants')
          .doc(restaurantId)
          .collection('menu_items')
          .get();

      return snapshot.docs
          .map((doc) => {...doc.data() as Map, 'id': doc.id})
          .toList();
    } catch (e) {
      return [];
    }
  }

  // ============= REVIEWS & RATINGS =============

  /// Add review
  static Future<bool> addReview({
    required String restaurantId,
    required String customerId,
    required double rating,
    required String comment,
  }) async {
    try {
      await _firestore
          .collection('restaurants')
          .doc(restaurantId)
          .collection('reviews')
          .add({
        'customerId': customerId,
        'rating': rating,
        'comment': comment,
        'createdAt': DateTime.now(),
      });

      // Update restaurant average rating
      await _updateRestaurantRating(restaurantId);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get restaurant reviews
  static Future<List<Map<String, dynamic>>> getRestaurantReviews(
      String restaurantId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('restaurants')
          .doc(restaurantId)
          .collection('reviews')
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => {...doc.data() as Map, 'id': doc.id})
          .toList();
    } catch (e) {
      return [];
    }
  }

  // ============= HELPER METHODS =============

  /// Update restaurant rating
  static Future<void> _updateRestaurantRating(String restaurantId) async {
    try {
      QuerySnapshot reviewsSnapshot = await _firestore
          .collection('restaurants')
          .doc(restaurantId)
          .collection('reviews')
          .get();

      if (reviewsSnapshot.docs.isEmpty) return;

      double totalRating = 0;
      for (var doc in reviewsSnapshot.docs) {
        totalRating += (doc['rating'] ?? 0).toDouble();
      }

      double averageRating = totalRating / reviewsSnapshot.docs.length;

      await _firestore.collection('restaurants').doc(restaurantId).update({
        'rating': averageRating,
      });
    } catch (e) {
      // Handle error silently
    }
  }

  /// Real-time listener for orders
  static Stream<List<Map<String, dynamic>>> streamRestaurantOrders(
      String restaurantId) {
    return _firestore
        .collection('orders')
        .where('restaurantId', isEqualTo: restaurantId)
        .where('status', whereIn: ['pending', 'confirmed', 'preparing'])
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => {...doc.data() as Map, 'id': doc.id})
            .toList());
  }
}
