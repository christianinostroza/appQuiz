import 'package:flutter/material.dart';
import 'package:myapp/initial_page.dart';
import 'package:myapp/quiz_home_page.dart';
// import 'quiz_page.dart';

class ResultPage extends StatelessWidget {
  final String playerName;
  final String quizKey;
  final int score;
  final int totalQuestions;

  const ResultPage({super.key, 
    required this.playerName,
    required this.quizKey,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Felicitaciones, $playerName!',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Score: $score / $totalQuestions',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InitialPage(),
                  ),
                );
              },
              child: const Text('Nuevo Quiz'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizHomePage(
                      playerName: playerName,
                      quizKey: quizKey,
                    ),
                  ),
                );
              },
              child: const Text('Volver a Empezar'),
            ),
          ],
        ),
      ),
    );
  }
}
