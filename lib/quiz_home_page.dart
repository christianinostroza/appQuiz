import 'package:flutter/material.dart';
import 'quiz_data.dart';
import 'result_page.dart';
import 'quiz_page.dart';

class QuizHomePage extends StatefulWidget {
  final String playerName;
  final String quizKey;

  const QuizHomePage({super.key, 
    required this.playerName,
    required this.quizKey,
  });

  @override
  // ignore: library_private_types_in_public_api
  _QuizHomePageState createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  int questionIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: questionIndex < quizData.length
          ? _buildQuizPage()
          : ResultPage(
              playerName: widget.playerName,
              quizKey: widget.quizKey,
              score: score,
              totalQuestions: quizData.length,
            ),
    );
  }

  Widget _buildQuizPage() {
    return QuizPage(
      playerName: widget.playerName,
      questionData: quizData[questionIndex],
      onAnswerSelected: (bool isCorrect) {
        setState(() {
          if (isCorrect) {
            score++;
          }
          questionIndex++;
        });
      },
      progressText: '${questionIndex + 1}/${quizData.length}',
    );
  }
}
