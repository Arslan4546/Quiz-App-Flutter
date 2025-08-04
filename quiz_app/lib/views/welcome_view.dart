import 'package:flutter/material.dart';
import 'package:quiz_app/viewmodels/welcome_view_model.dart';
import 'package:quiz_app/viewmodels/view_model_provider.dart';
import 'package:quiz_app/views/quiz_view.dart';
import 'package:quiz_app/widgets/responsive_container.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<WelcomeViewModel>(
      viewModel: WelcomeViewModel(),
      builder: (context, viewModel, _) {
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
                      _buildHeader(context),
                      const SizedBox(height: 40),
                      _buildFeatures(context, viewModel),
                      const SizedBox(height: 40),
                      _buildStartButton(context, viewModel),
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

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        // App logo/icon
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).primaryColor.withAlpha(51), // 0.2 * 255 = 51
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.quiz,
            size: 60,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 24),
        // App title
        Text(
          'Quiz App',
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        // App description
        Text(
          'Test your knowledge with our interactive quiz!',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFeatures(BuildContext context, WelcomeViewModel viewModel) {
    return Column(
      children: viewModel.features
          .map((feature) => _buildFeatureItem(context, feature))
          .toList(),
    );
  }

  Widget _buildFeatureItem(BuildContext context, FeatureItem feature) {
    IconData iconData;
    switch (feature.icon) {
      case 'lightbulb_outline':
        iconData = Icons.lightbulb_outline;
        break;
      case 'timer_outlined':
        iconData = Icons.timer_outlined;
        break;
      case 'auto_awesome':
        iconData = Icons.auto_awesome;
        break;
      default:
        iconData = Icons.star;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(iconData, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Text(feature.text, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildStartButton(BuildContext context, WelcomeViewModel viewModel) {
    return ElevatedButton(
      onPressed: () {
        viewModel.startQuiz();
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const QuizView()));
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          'Start Quiz',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
