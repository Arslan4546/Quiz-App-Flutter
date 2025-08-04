import 'package:flutter/material.dart';
import 'package:quiz_app/viewmodels/result_view_model.dart';
import 'package:quiz_app/viewmodels/view_model_provider.dart';
import 'package:quiz_app/views/welcome_view.dart';
import 'package:quiz_app/widgets/responsive_container.dart';

class ResultView extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultView({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ResultViewModel>(
      viewModel: ResultViewModel(score: score, totalQuestions: totalQuestions),
      builder: (context, viewModel, _) {
        final resultMessage = viewModel.getResultMessage();
        final resultIcon = viewModel.getResultIcon();
        final resultColor = viewModel.getResultColor(context);

        return Scaffold(
          body: ResponsiveContainer(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 80),
                      _buildResultHeader(context, resultIcon, resultColor),
                      const SizedBox(height: 40),
                      _buildScoreCard(
                        context,
                        viewModel,
                        resultMessage,
                        resultColor,
                      ),
                      const SizedBox(height: 40),
                      _buildActionButtons(context),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildResultHeader(BuildContext context, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: color.withAlpha(51), // 0.2 * 255 = 51
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 60, color: color),
        ),
        const SizedBox(height: 24),
        Text(
          'Quiz Completed!',
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildScoreCard(
    BuildContext context,
    ResultViewModel viewModel,
    String message,
    Color color,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text('Your Score', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: viewModel.percentage / 100,
                    strokeWidth: 12,
                    backgroundColor: Theme.of(context).dividerColor,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '$score/$totalQuestions',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    Text(
                      '${viewModel.percentage.toInt()}%',
                      style: TextStyle(fontSize: 18, color: color),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              message,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const WelcomeView()),
              (route) => false,
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Back to Home',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
