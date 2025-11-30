import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/pages/main_navigation_wrapper.dart';
import 'package:ecommerce/pages/login_screen.dart';
import 'package:ecommerce/services/auth_service.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService(FirebaseAuth.instance);

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        // User is logged in
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user != null) {
            return const MainNavigationWrapper();
          }
          // User is not logged in
          return const LoginScreen();
        }
        // Show a loading indicator while waiting for the auth state
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
