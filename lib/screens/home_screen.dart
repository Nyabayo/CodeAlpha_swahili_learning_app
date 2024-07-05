import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swahili_learning_app/screens/lesson_screen.dart';
import 'package:swahili_learning_app/screens/quiz_screen.dart';
import 'package:swahili_learning_app/screens/achievements_screen.dart';
import 'package:swahili_learning_app/screens/forum_screen.dart';
import 'package:swahili_learning_app/providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Swahili Learning App'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authProvider.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LessonScreen()),
                );
              },
              child: Text('Lessons'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              child: Text('Quizzes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AchievementsScreen()),
                );
              },
              child: Text('Achievements'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForumScreen()),
                );
              },
              child: Text('Community Forum'),
            ),
          ],
        ),
      ),
    );
  }
}
