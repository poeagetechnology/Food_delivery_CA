import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  static User? get currentUser => _auth.currentUser;

  // Sign up with email and password
  static Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
    required String name,
    required String role, // 'customer' or 'restaurant'
  }) async {
    try {
      // Create user in Firebase Auth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create user profile in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'name': name,
        'role': role,
        'createdAt': DateTime.now(),
        'profilePicture': '',
        'phone': '',
        'address': '',
      });

      return {
        'success': true,
        'message': 'Sign up successful',
        'uid': userCredential.user!.uid,
        'role': role,
      };
    } on FirebaseAuthException catch (e) {
      return {
        'success': false,
        'message': _getAuthErrorMessage(e.code),
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'An unexpected error occurred',
      };
    }
  }

  // Login with email and password
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get user role from Firestore
      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      String userRole = userDoc['role'] ?? 'customer';

      return {
        'success': true,
        'message': 'Login successful',
        'uid': userCredential.user!.uid,
        'role': userRole,
      };
    } on FirebaseAuthException catch (e) {
      return {
        'success': false,
        'message': _getAuthErrorMessage(e.code),
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'An unexpected error occurred',
      };
    }
  }

  // Logout
  static Future<void> logout() async {
    await _auth.signOut();
  }

  // Get user profile from Firestore
  static Future<Map<String, dynamic>?> getUserProfile(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      return doc.data() as Map<String, dynamic>?;
    } catch (e) {
      return null;
    }
  }

  // Update user profile
  static Future<bool> updateUserProfile({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection('users').doc(uid).update(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Helper function to get auth error messages
  static String _getAuthErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'Email is already registered';
      case 'weak-password':
        return 'Password is too weak';
      case 'invalid-email':
        return 'Invalid email address';
      default:
        return 'Authentication failed: $code';
    }
  }
}
