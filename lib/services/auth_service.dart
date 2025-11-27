
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> reloadUser() async {
    try {
      await _firebaseAuth.currentUser?.reload();
    } catch (e) {
      // Handle potential errors, e.g., user is no longer signed in.
      throw Exception('Failed to reload user.');
    }
  }

  Future<UserCredential?> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return userCredential;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception('An unexpected error occurred. Please try again.');
    }
  }

  Future<UserCredential?> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return userCredential;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception('An unexpected error occurred. Please try again.');
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
    } catch (e) {
      throw Exception('An unexpected error occurred. Please try again.');
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> updateProfile({String? displayName, String? photoURL}) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updateProfile(displayName: displayName, photoURL: photoURL);
      }
    } catch (e) {
      throw Exception('An unexpected error occurred. Please try again.');
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Error signing out. Please try again.');
    }
  }
}
