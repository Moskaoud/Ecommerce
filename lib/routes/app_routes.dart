import 'package:flutter/material.dart';
import 'package:ecommerce/pages/cart/cart.dart';
import 'package:ecommerce/pages/cart/checkout.dart';
import 'package:ecommerce/pages/customer_entry_screen.dart';
import 'package:ecommerce/pages/forgot_password_screen.dart';
import 'package:ecommerce/pages/profile_page.dart'; // Import the new profile page

import '../pages/cart/checkout2.dart';

// New Auth Screen Imports
import 'package:ecommerce/pages/login_screen.dart';
import 'package:ecommerce/pages/registration_screen.dart';
import 'package:ecommerce/pages/main_navigation_wrapper.dart';

class AppRoutes {
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String checkout2 = '/checkout2';
  static const String portfolio = '/portfolio';
  static const String profile = '/profile'; // Add profile route
  static const String cartCounter = '/cartCounter';
  static const String paymentScreen = '/paymentScreen';
  static const String customerEntryScreen = '/customerEntryScreen';
  static const String customerProfileScreen = '/customerProfileScreen';
  static const String animationSession = '/animationSession';

  // New Auth Route Names
  static const String authLogin = '/auth_login';
  static const String register = '/register';
  static const String home = '/home';
  static const String forgotPassword = '/forgot_password';

  // Add other route names here

  static Map<String, WidgetBuilder> get routes {
    return {
      customerEntryScreen: (context) => const CustomerEntryScreen(),
      cart: (context) => const CartScreen(),
      checkout: (context) => const Checkout(),
      checkout2: (context) => const Checkout2(),

      profile: (context) => const ProfilePage(), // Add profile route mapping
      // New Auth Routes
      authLogin: (context) => const LoginScreen(),
      register: (context) => const RegistrationScreen(),
      home: (context) => const MainNavigationWrapper(),
      forgotPassword: (context) => const ForgotPasswordScreen(),
      // Add other routes here
    };
  }
}
