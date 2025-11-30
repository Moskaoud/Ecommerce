import 'package:ecommerce/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/auth_wrapper.dart'; // Import the new AuthWrapper
import 'models/payment.dart';
import 'models/cart_model.dart';
import 'routes/app_routes.dart';
import 'utils/theme/app_theme.dart';
import 'viewmodels/login_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:ecommerce/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final NotificationService notificationService = NotificationService();
  await notificationService.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => Payment()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // The initialRoute is no longer needed as the AuthWrapper handles the starting screen.
      home: const AuthWrapper(), // Set AuthWrapper as the home
      routes: AppRoutes.routes,
    );
  }
}
