import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_model.dart';
import 'package:quiz_app/repositories/quiz_repository.dart';
import 'package:quiz_app/viewmodels/base_view_model.dart';

class QuizViewModel extends BaseViewModel {
  final QuizRepository _quizRepository;
  
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _answered = false;
  int? _selectedAnswerIndex;
  
  // Timer related properties
  static const int questionTimeLimit = 30; // 30 seconds per question
  int _remainingTime = questionTimeLimit;
  Timer? _timer;
  bool _isTimerActive = false;
  
  // Getters
  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  bool get answered => _answered;
  int? get selectedAnswerIndex => _selectedAnswerIndex;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  bool get isFirstQuestion => _currentQuestionIndex == 0;
  bool get isLastQuestion => _currentQuestionIndex == _questions.length - 1;
  double get progressValue => (_currentQuestionIndex + 1) / _questions.length;
  int get remainingTime => _remainingTime;
  bool get isTimerActive => _isTimerActive;
  
  // Timer progress value (0.0 to 1.0)
  double get timerProgressValue => _remainingTime / questionTimeLimit;

  QuizViewModel({QuizRepository? quizRepository}) 
      : _quizRepository = quizRepository ?? QuizRepository();

  // Initialize the quiz
  Future<void> initQuiz() async {
    setLoading(true);
    try {
      _questions = await _quizRepository.getQuestions();
      _currentQuestionIndex = 0;
      _score = 0;
      _answered = false;
      _selectedAnswerIndex = null;
      _remainingTime = questionTimeLimit;
      clearError();
      
      // Start the timer after loading is complete
      _startTimer();
    } catch (e) {
      setError('Failed to load quiz questions: $e');
    } finally {
      setLoading(false);
    }
  }
  
  // Start the question timer
  void _startTimer() {
    _isTimerActive = true;
    _remainingTime = questionTimeLimit;
    
    // Cancel any existing timer
    _timer?.cancel();
    
    // Create a new timer that fires every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        notifyListeners();
      } else {
        // Time's up - move to next question if not answered
        if (!_answered) {
          _timeUp();
        }
      }
    });
    
    notifyListeners();
  }
  
  // Handle time up event
  void _timeUp() {
    _answered = true;
    _timer?.cancel();
    _isTimerActive = false;
    notifyListeners();
    
    // The dialog will be shown in the view and user will manually move to next question
  }
  
  // Stop the timer
  void _stopTimer() {
    _timer?.cancel();
    _isTimerActive = false;
    notifyListeners();
  }

  // Select an answer
  void selectAnswer(int index) {
    if (_answered) return;
    
    _selectedAnswerIndex = index;
    _answered = true;
    
    // Stop the timer when an answer is selected
    _stopTimer();
    
    // Update score if correct
    if (index == currentQuestion.correctAnswerIndex) {
      _score++;
    }
    
    notifyListeners();
  }

  // Move to the next question
  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _answered = false;
      _selectedAnswerIndex = null;
      
      // Start the timer for the new question
      _startTimer();
      
      notifyListeners();
    }
  }

  // Move to the previous question
  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      _answered = false;
      _selectedAnswerIndex = null;
      
      // Start the timer for the previous question
      _startTimer();
      
      notifyListeners();
    }
  }

  // Reset the quiz
  void resetQuiz() {
    _currentQuestionIndex = 0;
    _score = 0;
    _answered = false;
    _selectedAnswerIndex = null;
    
    // Restart the timer
    _startTimer();
    
    notifyListeners();
  }
  
  @override
  void dispose() {
    // Make sure to cancel the timer when the view model is disposed
    _timer?.cancel();
    super.dispose();
  }
}