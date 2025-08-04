import 'package:quiz_app/models/quiz_model.dart';
import 'package:quiz_app/services/quiz_service.dart';

class QuizRepository {
  final QuizService _quizService;

  QuizRepository({QuizService? quizService}) 
      : _quizService = quizService ?? QuizService();

  Future<List<Question>> getQuestions() async {
    return await _quizService.getQuestions();
  }

  Future<Question> getQuestionByIndex(int index) async {
    return await _quizService.getQuestionByIndex(index);
  }

  Future<int> getQuestionCount() async {
    return await _quizService.getQuestionCount();
  }
}