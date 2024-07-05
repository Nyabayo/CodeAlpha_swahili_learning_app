import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swahili_learning_app/providers/lesson_provider.dart';
import 'package:swahili_learning_app/models/lesson.dart';

class LessonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lessonProvider = Provider.of<LessonProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons'),
      ),
      body: FutureBuilder(
        future: lessonProvider.fetchLessons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (lessonProvider.lessons.isEmpty) {
            return Center(child: Text('No lessons available.'));
          }
          return ListView.builder(
            itemCount: lessonProvider.lessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(lessonProvider.lessons[index].title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonDetailScreen(
                        lesson: lessonProvider.lessons[index],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class LessonDetailScreen extends StatelessWidget {
  final Lesson lesson;

  LessonDetailScreen({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(lesson.content),
      ),
    );
  }
}
