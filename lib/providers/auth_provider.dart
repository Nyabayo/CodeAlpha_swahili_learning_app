import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _user;

  String? get user => _user;

  Future<void> signIn(String username, String password) async {
    // Replace with your actual authentication logic
    if (username == 'user' && password == 'password') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', username);
      _user = username;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    _user = null;
    notifyListeners();
  }
}
