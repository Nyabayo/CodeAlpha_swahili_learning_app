import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressProvider with ChangeNotifier {
  int _progress = 0;

  int get progress => _progress;

  Future<void> loadProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _progress = prefs.getInt('progress') ?? 0;
    notifyListeners();
  }

  Future<void> updateProgress(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _progress = value;
    await prefs.setInt('progress', _progress);
    notifyListeners();
  }
}
