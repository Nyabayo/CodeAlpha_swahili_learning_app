import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swahili_learning_app/providers/progress_provider.dart';

class AchievementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final progressProvider = Provider.of<ProgressProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Lessons Completed: ${progressProvider.progress}'),
            ElevatedButton(
              onPressed: () {
                // Show list of achievements
              },
              child: Text('View Achievements'),
            ),
          ],
        ),
      ),
    );
  }
}
