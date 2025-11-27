import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // Hardcoded correct credentials for example
  final String _correctEmail = "test@example.com";
  final String _correctPassword = "password123";

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    if (email.toLowerCase() == _correctEmail && password == _correctPassword) {
      _isLoggedIn = true;
    } else {
      _errorMessage = 'Invalid email or password. Please try again.';
    }

    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _errorMessage = null;
    notifyListeners();
  }
}
