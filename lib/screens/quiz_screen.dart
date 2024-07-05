import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swahili_learning_app/providers/quiz_provider.dart';
import 'package:swahili_learning_app/models/quiz.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Quizzes'),
      ),
      body: FutureBuilder(
        future: quizProvider.fetchQuizzes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: quizProvider.quizzes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(quizProvider.quizzes[index].question),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizDetailScreen(
                        quiz: quizProvider.quizzes[index],
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

class QuizDetailScreen extends StatefulWidget {
  final Quiz quiz;

  QuizDetailScreen({required this.quiz});

  @override
  _QuizDetailScreenState createState() => _QuizDetailScreenState();
}

class _QuizDetailScreenState extends State<QuizDetailScreen> {
  int? _selectedOption;

  void _checkAnswer() {
    if (_selectedOption == widget.quiz.correctOptionIndex) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Correct!'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Incorrect!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.question),
      ),
      body: ListView.builder(
        itemCount: widget.quiz.options.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.quiz.options[index]),
            leading: Radio(
              value: index,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value as int?;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: _checkAnswer,
      ),
    );
  }
}
