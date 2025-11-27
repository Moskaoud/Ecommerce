
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/services/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _photoURLController = TextEditingController();
  final AuthService _authService = AuthService(FirebaseAuth.instance);

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _authService.authStateChanges.listen((user) {
      if (user != null && mounted) {
        setState(() {
          _nameController.text = user.displayName ?? '';
          _photoURLController.text = user.photoURL ?? '';
        });
      }
    });
    final user = _authService.currentUser;
    if (user != null) {
      _nameController.text = user.displayName ?? '';
      _photoURLController.text = user.photoURL ?? '';
    }
  }

  Future<void> _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await _authService.updateProfile(
          displayName: _nameController.text,
          photoURL: _photoURLController.text,
        );

        // Reload the user to get the updated info
        await _authService.reloadUser();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile updated successfully!')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = _authService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              if (user != null)
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: user.photoURL != null && user.photoURL!.isNotEmpty
                        ? NetworkImage(user.photoURL!)
                        : null,
                    child: user.photoURL == null || user.photoURL!.isEmpty
                        ? const Icon(Icons.person, size: 50)
                        : null,
                  ),
                ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _photoURLController,
                decoration: const InputDecoration(labelText: 'Photo URL'),
              ),
              const SizedBox(height: 24.0),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _updateProfile,
                      child: const Text('Update Profile'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
