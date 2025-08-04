import 'package:quiz_app/viewmodels/base_view_model.dart';

class WelcomeViewModel extends BaseViewModel {
  // Features list for the welcome screen
  final List<FeatureItem> features = [
    FeatureItem(icon: 'lightbulb_outline', text: 'Learn with fun quizzes'),
    FeatureItem(icon: 'timer_outlined', text: 'Test your knowledge'),
    FeatureItem(icon: 'auto_awesome', text: 'Beautiful UI with dark mode'),
  ];

  // Method to handle start quiz action
  void startQuiz() {
    // This is just a placeholder for any logic that might be needed before starting the quiz
    // For example, we could load user preferences, initialize quiz data, etc.
    setLoading(true);
    
    // Simulate some initialization process
    Future.delayed(const Duration(milliseconds: 300), () {
      setLoading(false);
    });
  }
}

class FeatureItem {
  final String icon;
  final String text;

  FeatureItem({required this.icon, required this.text});
}