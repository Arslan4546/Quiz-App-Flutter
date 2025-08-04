import 'package:quiz_app/models/quiz_model.dart';

class QuizService {
  // Get all questions
  Future<List<Question>> getQuestions() async {
    // Simulating API call with a delay
    await Future.delayed(const Duration(milliseconds: 500));
    return QuizData.questions;
  }

  // Get a specific question by index
  Future<Question> getQuestionByIndex(int index) async {
    // Simulating API call with a delay
    await Future.delayed(const Duration(milliseconds: 300));
    return QuizData.questions[index];
  }

  // Get the total number of questions
  Future<int> getQuestionCount() async {
    // Simulating API call with a delay
    await Future.delayed(const Duration(milliseconds: 200));
    return QuizData.questions.length;
  }
}