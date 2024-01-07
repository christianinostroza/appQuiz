import 'dart:convert';
import 'dart:io';

class ScoreManager {
  // ignore: prefer_const_declarations
  static final String _scoreFilePath = 'scores.json';

  static Map<String, dynamic> _loadScores() {
    try {
      File file = File(_scoreFilePath);
      if (file.existsSync()) {
        String contents = file.readAsStringSync();
        return json.decode(contents);
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error loading scores: $e');
    }
    return {};
  }

  static void _saveScores(Map<String, dynamic> scores) {
    try {
      File file = File(_scoreFilePath);
      file.writeAsStringSync(json.encode(scores));
    } catch (e) {
      // ignore: avoid_print
      print('Error saving scores: $e');
    }
  }

  static void saveScore({required String playerName, required String quizId, required int score}) {
    Map<String, dynamic> scores = _loadScores();
    scores[quizId] = {'playerName': playerName, 'score': score};
    _saveScores(scores);
  }

  static List<Map<String, dynamic>> getScores() {
    Map<String, dynamic> scores = _loadScores();
    List<Map<String, dynamic>> scoreList = [];
    scores.forEach((quizId, data) {
      scoreList.add({'quizId': quizId, ...data});
    });
    return scoreList;
  }
}
