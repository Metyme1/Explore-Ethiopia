import 'package:firebase_auth/firebase_auth.dart';

class UserManager {
  static String? userId;

  static Future<void> getCurrentUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        userId = user.uid;
      }
    } catch (e) {
      print('Error getting user ID: $e');
    }
  }
}