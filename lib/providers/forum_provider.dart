import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForumProvider with ChangeNotifier {
  List<Map<String, dynamic>> _messages = [];

  List<Map<String, dynamic>> get messages => _messages;

  Future<void> fetchMessages() async {
    try {
      final response = await http.get(Uri.parse('https://example.com/forum'));
      if (response.statusCode == 200) {
        _messages = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        notifyListeners();
      } else {
        throw Exception('Failed to load messages');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> sendMessage(String message, String userId) async {
    try {
      final response = await http.post(
        Uri.parse('https://example.com/forum'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': message, 'userId': userId}),
      );
      if (response.statusCode == 200) {
        fetchMessages();
      } else {
        throw Exception('Failed to send message');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
