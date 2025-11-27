
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService(FirebaseAuth.instance);
  late StreamSubscription<User?> _authSubscription;
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _authService.currentUser;
    // Listen for auth changes (login/logout) to update the state.
    _authSubscription = _authService.authStateChanges.listen((user) {
      if (mounted) {
        setState(() {
          _user = user;
        });
      }
    });
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }

  Future<void> _navigateToProfile() async {
    // Wait for the user to return from the profile page.
    await Navigator.of(context).pushNamed(AppRoutes.profile);

    // When the user returns, force a reload of the user data from Firebase.
    try {
      await _authService.reloadUser();
      if (mounted) {
        setState(() {
          _user = _authService.currentUser;
        });
      }
    } catch (e) {
      // Handle error if user could not be reloaded.
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not refresh user data: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = _user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              await _authService.signOut();
            },
          )
        ],
      ),
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome, ${user.displayName?.isNotEmpty == true ? user.displayName : 'User'}!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Logged in as: ${user.email}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: user.emailVerified ? Colors.green[100] : Colors.amber[100],
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            user.emailVerified ? Icons.verified_user : Icons.warning,
                            color: user.emailVerified ? Colors.green : Colors.amber,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            user.emailVerified ? 'Email is Verified' : 'Email Not Verified',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: user.emailVerified ? Colors.green[800] : Colors.amber[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (!user.emailVerified)
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await _authService.sendVerificationEmail();
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Verification email sent!')),
                            );
                          }
                        } catch (e) {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        }
                      },
                      child: const Text('Resend Verification Email'),
                    ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _navigateToProfile,
                    child: const Text('Edit Profile'),
                  ),
                ],
              ),
            ),
    );
  }
}
