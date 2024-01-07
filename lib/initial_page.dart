import 'package:flutter/material.dart';
import 'package:myapp/quiz_home_page.dart';
// import 'quiz_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  late TextEditingController nameController;
  String quizKey = "";

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    generateQuizKey();
  }

  void generateQuizKey() {
    quizKey = DateTime.now().millisecondsSinceEpoch.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Ingresa tu Nombre'),
            ),
            const SizedBox(height: 20),
            Text('Quiz Key: $quizKey'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizHomePage(
                      playerName: nameController.text,
                      quizKey: quizKey,
                    ),
                  ),
                );
              },
              child: const Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
