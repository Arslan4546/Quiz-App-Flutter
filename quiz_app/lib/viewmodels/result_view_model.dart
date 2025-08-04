import 'package:flutter/material.dart';
import 'package:quiz_app/viewmodels/base_view_model.dart';

class ResultViewModel extends BaseViewModel {
  final int score;
  final int totalQuestions;

  ResultViewModel({required this.score, required this.totalQuestions});

  // Calculate percentage score
  double get percentage => (score / totalQuestions) * 100;

  // Get result message based on percentage
  String getResultMessage() {
    if (percentage >= 90) {
      return 'Excellent! You\'re a quiz master!';
    } else if (percentage >= 70) {
      return 'Great job! You know your stuff!';
    } else if (percentage >= 50) {
      return 'Good effort! Keep learning!';
    } else {
      return 'Keep practicing! You\'ll improve!';
    }
  }

  // Get result icon based on percentage
  IconData getResultIcon() {
    if (percentage >= 90) {
      return Icons.emoji_events;
    } else if (percentage >= 70) {
      return Icons.thumb_up;
    } else if (percentage >= 50) {
      return Icons.sentiment_satisfied;
    } else {
      return Icons.sentiment_neutral;
    }
  }

  // Get result color based on percentage
  Color getResultColor(BuildContext context) {
    if (percentage >= 90) {
      return Colors.amber;
    } else if (percentage >= 70) {
      return Theme.of(context).primaryColor;
    } else if (percentage >= 50) {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }
}