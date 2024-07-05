import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:swahili_learning_app/models/lesson.dart';

class LessonProvider with ChangeNotifier {
  List<Lesson> _lessons = [];

  List<Lesson> get lessons => _lessons;

  Future<void> fetchLessons() async {
    try {
      final String response = await rootBundle.loadString('assets/data/lessons.json');
      final List<dynamic> data = jsonDecode(response);
      _lessons = data.map((lesson) => Lesson.fromJson(lesson)).toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
