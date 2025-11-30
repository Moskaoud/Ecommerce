import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:ecommerce/pages/edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService(FirebaseAuth.instance);

    return StreamBuilder<User?>(
      stream: authService.userChanges, // Listen to user changes (updates)
      builder: (context, snapshot) {
        final User? user = snapshot.data;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
              child: Column(
                children: [
                  // Avatar
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: user?.photoURL != null
                          ? NetworkImage(user!.photoURL!)
                          : const NetworkImage(
                              'https://i.pravatar.cc/150?img=12',
                            ), // Placeholder
                    ),
                  ),
                  const SizedBox(height: 30),

                  // User Info Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user?.displayName ?? 'User Name',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                user?.email ?? 'email@example.com',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                '121-224-7890', // Placeholder phone
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EditProfilePage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                              color: Color(0xFF8E6CEF), // Purple
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Menu Items
                  _buildMenuItem(context, 'Address'),
                  _buildMenuItem(context, 'Wishlist'),
                  _buildMenuItem(context, 'Payment'),
                  _buildMenuItem(context, 'Help'),
                  _buildMenuItem(context, 'Support'),

                  const SizedBox(height: 30),

                  // Sign Out Button
                  TextButton(
                    onPressed: () async {
                      await authService.signOut();
                      // Navigation to login is handled by AuthWrapper
                    },
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.black54,
        ),
        onTap: () {
          // Placeholder for navigation
        },
      ),
    );
  }
}
