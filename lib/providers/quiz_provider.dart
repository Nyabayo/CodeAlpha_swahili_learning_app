import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swahili_learning_app/models/quiz.dart';

class QuizProvider with ChangeNotifier {
  List<Quiz> _quizzes = [];

  List<Quiz> get quizzes => _quizzes;

  Future<void> fetchQuizzes() async {
    try {
      final String response = await rootBundle.loadString('assets/data/quizzes.json');
      final List<dynamic> data = jsonDecode(response);
      _quizzes = data.map((quiz) => Quiz.fromJson(quiz)).toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
