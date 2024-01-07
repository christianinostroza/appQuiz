import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  final String playerName;
  final Map<String, dynamic> questionData;
  final Function(bool) onAnswerSelected;
  final String progressText;

  const QuizPage({
    super.key,
    required this.playerName,
    required this.questionData,
    required this.onAnswerSelected,
    required this.progressText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bienvenido, $playerName!, el desafío comienza...',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center, // Alineación central del texto
          ),
          const SizedBox(height: 16),
          Text(
            progressText,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              questionData['question'],
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  onAnswerSelected(true);
                },
                child: const Text('Verdarero'),
              ),
              ElevatedButton(
                onPressed: () {
                  onAnswerSelected(false);
                },
                child: const Text('Mentira'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
