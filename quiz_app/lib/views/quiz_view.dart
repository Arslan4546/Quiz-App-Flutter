import 'package:flutter/material.dart';
import 'package:quiz_app/theme/app_theme.dart';
import 'package:quiz_app/viewmodels/quiz_view_model.dart';
import 'package:quiz_app/viewmodels/view_model_provider.dart';
import 'package:quiz_app/views/result_view.dart';
import 'package:quiz_app/widgets/responsive_container.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  late QuizViewModel _viewModel;
  
  @override
  void initState() {
    super.initState();
  }
  
  void _showTimeUpDialog(BuildContext context, QuizViewModel viewModel) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.timer_off, color: Theme.of(context).colorScheme.error),
              const SizedBox(width: 8),
              const Text('Time\'s Up!'),
            ],
          ),
          content: Text(
            'The correct answer is: ${viewModel.currentQuestion.options[viewModel.currentQuestion.correctAnswerIndex]}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Next Question'),
              onPressed: () {
                Navigator.of(context).pop();
                viewModel.nextQuestion();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<QuizViewModel>(
      viewModel: QuizViewModel(),
      onViewModelReady: (viewModel) => viewModel.initQuiz(),
      builder: (context, viewModel, _) {
        _viewModel = viewModel;
        
        // Listen for timer events
          if (viewModel.isTimerActive && viewModel.remainingTime <= 0 && !viewModel.answered) {
            // Use a post-frame callback to avoid build errors
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showTimeUpDialog(context, viewModel);
            });
          }
        
        if (viewModel.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (viewModel.errorMessage != null) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${viewModel.errorMessage}',
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => viewModel.initQuiz(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Quiz'),
            elevation: 0,
          ),
          body: ResponsiveContainer(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildProgressIndicator(context, viewModel),
                  const SizedBox(height: 24),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildQuestionCard(context, viewModel),
                          const SizedBox(height: 24),
                          _buildAnswerOptions(context, viewModel),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildNavigationButtons(context, viewModel),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressIndicator(BuildContext context, QuizViewModel viewModel) {
    // Determine timer color based on remaining time
    Color timerColor = Theme.of(context).colorScheme.primary;
    if (viewModel.remainingTime < 10) {
      timerColor = Theme.of(context).colorScheme.error;
    } else if (viewModel.remainingTime < 20) {
      timerColor = Theme.of(context).colorScheme.tertiary;
    }
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Question ${viewModel.currentQuestionIndex + 1}/${viewModel.questions.length}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Icon(
              Icons.timer,
              color: timerColor,
              size: 20,
            ),
            const SizedBox(width: 4),
            Text(
              '${viewModel.remainingTime}s',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: timerColor,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              'Score: ${viewModel.score}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuestionCard(BuildContext context, QuizViewModel viewModel) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              viewModel.currentQuestion.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            if (viewModel.answered) ...[  // Show explanation only after answering
              const SizedBox(height: 16),
              Text(
                'Explanation:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                viewModel.currentQuestion.explanation,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerOptions(BuildContext context, QuizViewModel viewModel) {
    return Column(
      children: List.generate(
        viewModel.currentQuestion.options.length,
        (index) => _buildAnswerOption(context, viewModel, index),
      ),
    );
  }

  Widget _buildAnswerOption(BuildContext context, QuizViewModel viewModel, int index) {
    final option = viewModel.currentQuestion.options[index];
    final correctIndex = viewModel.currentQuestion.correctAnswerIndex;
    
    // Determine the button color based on selection and correctness
    Color? backgroundColor;
    Color? textColor;
    
    if (viewModel.answered) {
      if (index == correctIndex) {
        backgroundColor = AppTheme.correctAnswerColor;
        textColor = Colors.white;
      } else if (index == viewModel.selectedAnswerIndex) {
        backgroundColor = AppTheme.wrongAnswerColor;
        textColor = Colors.white;
      }
    } else if (index == viewModel.selectedAnswerIndex) {
      backgroundColor = Theme.of(context).primaryColor;
      textColor = Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: viewModel.answered ? null : () => viewModel.selectAnswer(index),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: backgroundColor ?? Theme.of(context).dividerColor,
              width: 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColor != null
                      ? Colors.white.withAlpha(51) // 0.2 * 255 = 51
                      : Theme.of(context).primaryColor.withAlpha(26), // 0.1 * 255 = 26
                ),
                child: Center(
                  child: Text(
                    String.fromCharCode(65 + index), // A, B, C, D...
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: backgroundColor != null
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                  ),
                  softWrap: true,
                ),
              ),
              if (viewModel.answered && index == correctIndex)
                const Icon(Icons.check_circle, color: Colors.white),
              if (viewModel.answered && index == viewModel.selectedAnswerIndex && index != correctIndex)
                const Icon(Icons.cancel, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons(BuildContext context, QuizViewModel viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (viewModel.isFirstQuestion)
              const SizedBox(width: 100) // Placeholder for alignment
            else
              OutlinedButton(
                onPressed: () => viewModel.previousQuestion(),
                child: constraints.maxWidth < 300 
                  ? const Icon(Icons.arrow_back)
                  : const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back),
                        SizedBox(width: 8),
                        Text('Previous'),
                      ],
                    ),
              ),
              
            ElevatedButton(
              onPressed: viewModel.answered
                  ? () {
                      if (!viewModel.isLastQuestion) {
                        viewModel.nextQuestion();
                      } else {
                        // Quiz completed, navigate to results
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ResultView(
                              score: viewModel.score,
                              totalQuestions: viewModel.questions.length,
                            ),
                          ),
                        );
                      }
                    }
                  : null, // Disable if not answered
              child: constraints.maxWidth < 300
                ? Icon(viewModel.isLastQuestion ? Icons.check : Icons.arrow_forward)
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(viewModel.isLastQuestion ? 'Finish' : 'Next'),
                      const SizedBox(width: 8),
                      Icon(viewModel.isLastQuestion ? Icons.check : Icons.arrow_forward),
                    ],
                  ),
            ),
          ],
        );
      },
    );
  }
}